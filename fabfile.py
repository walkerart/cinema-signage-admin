from fabric.api import run, cd, env, sudo, prompt, settings
from fabric.context_managers import hide
from fabric.colors import green, yellow
# recommended .ssh/config entry:
# Host ec2-23-22-212-169.compute-1.amazonaws.com
#      IdentityFile ~/.ssh/walker-aws.pem
#      ControlPersist 3600
#      ControlPath ~/.ssh/master-%r@%h:%p
#      User deployer
# env.user = 'deployer'
env.use_ssh_config = True
env.project_path = 'cinema_wall'
env.branch = 'master'
env.hosts = ['ec2-23-22-212-169.compute-1.amazonaws.com']


def deploy(deploy_assets=True):
    git_pull()
    bundle()
    whenever()
    if deploy_assets and deploy_assets != 'false':
        precompile()
    reload_workers()
    zero_downtime_restart()

def meminfo():
    master = run("ps Sv {}".format(master_pid()))
    jobs = run("ps Sv {}".format(delayed_job_pid()))
    out = green("meminfo master:\n\n {}".format(master))
    print out + green("meminfo jobs:\n\n {}".format(jobs))

def view_unicorns():
    run("ps ax | grep unicorn_rails")

def pid_path(service):
    return "{}/tmp/pids/{}.pid".format(env.project_path, service)

def master_pid():
    pid = run("cat {}".format(pid_path('unicorn')))
    print pid
    return pid

def delayed_job_pid():
    pid = run("cat {}".format(pid_path('delayed_job')))
    print pid
    return pid

def worker_count():
    with cd(env.project_path):
        number = run("ls tmp/pids/delayed_job* 2> /dev/null | wc -l")
    return str(int(number) - 1)

def workers(number=None):
    with hide('stdout'):
      if worker_count() == number:
          print yellow('no change. {} workers exists'.format(number))
      elif number == 'status' or number == None:
          with cd(env.project_path):
              run('./script/delayed_job status')
      else:
          with cd(env.project_path):
              print yellow("restarting workers") #can't do it "in place"
              run("./script/delayed_job stop")
              run("./script/delayed_job -n {} start".format(number))
      print green(worker_count() + ' workers running')

def reload_workers():
    with cd(env.project_path):
        run("./script/delayed_job restart")

def stop_workers():
    with cd(env.project_path):
        run("./script/delayed_job stop")

def signal_master(signal):
    pid = master_pid()
    run('kill {} {}'.format(signal,pid))

def zero_downtime_restart():
    signal_master('-USR2')

def start_server():
    with cd(env.project_path):
        run('bin/unicorn_rails -D -c config/unicorn.rb')

def stop_server():
    signal_master('-9')

def git_pull():
    with cd(env.project_path):
        run("git fetch; git reset --hard origin/{}".format( env.branch  ))
        run('git submodule update')

def whenever():
    with cd(env.project_path):
        run("./bin/whenever -w --set 'environment={}'".format( env.environment ))

def precompile():
    with cd(env.project_path):
        run('rake assets:precompile')

def rvm_info():
    with cd(env.project_path):
        run('rvm info')

def rake(args):
    with cd(env.project_path):
        run('rake %s' % args)


def bundle():
    with cd(env.project_path):
        run('bundle install --binstubs --without development test --deployment')
    
def sup(command,service):
    'use: fab sup:thin,restart'
    return sudo('supervisorctl {} {}'.format(command,service))

def tail(number=200, log='production'):
    run("tail -n {} {}/log/{}.log".format(number, env.project_path, log))

def rvm():
    with settings(warn_only=True):
        rvm_missing = run('which rvm').failed
    if rvm_missing:
        run("curl -L https://get.rvm.io | bash -s stable")    
        

def setup():
    """requires:
         - user, git, curl, libxml2-dev, libxslt-dev, libsqlite3-dev (should use puppet)
         - ssh  access as user on remote machine (see top of file)
         - configure nginx with upstream socket (should use puppet)
         - set RAILS_ENV=production in /etc/environment (sohuld use puppet)
    """
    with settings(warn_only=True):
        if run('cat setup-complete').succeeded:
            print green("complete")
            return True
    run("mkdir -p {}".format(env.project_path))
    run("git clone {}".format(prompt("repo:")))
    rvm()
    run('rvm install 1.9.3')
    with cd(env.project_path):
        run("rvm info")
        run("gem install bundler")
    bundle()
    rake("db:create")
    rake("db:schema:load")
    rake("db:seed")
    start_server()
    run("touch setup-complete")
