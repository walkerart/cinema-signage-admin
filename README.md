``` bash
git clone git@github.com:walkerart/cinema_wall.git
cd cinema_wall (yes to rvm)
bundle
rake db:migrate # or rake db:schema:load
rake db:seed # to create the example user
rails s
admin@example.com:password@localhost:3000/cinema_wall/admin

```

also:

    rake db:test:prepare

    rspec

will display the documentation

    cucumber
will drive a headless web browser through the application and 
show some example xml

The xml is accessible at /cinema_wall.xml

