require 'dragonfly'
require 'dragonfly/rails/images'

module S3

  def self.apply_configuration(app, *args)
    app.configure do |c|
      c.datastore = Dragonfly::DataStorage::S3DataStore.new
      c.datastore.configure do |c|
        c.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
        c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      end
    end
  end

end

Dragonfly[:images].configure_with(S3) do |c|
  c.url_format = '/cinema_wall/admin/media/:job/:basename.:format'
  c.url_host = 'http://walkerart.org' if Rails.env.production?

  c.datastore.configure do |store|
    store.bucket_name = 'cinema-wall'
    store.storage_headers = {
                'x-amz-acl' => 'public-read',
                'Cache-Control' => 'max-age=315576000',
                "x-rails-environment" => Rails.env}
  end
end

if Rails.env.test? || Rails.env.development?
  Rails.application.middleware.delete Rack::Cache
  Rails.application.middleware.insert 0, Rack::Cache, {
    :verbose     => false,
    :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"), # URI encoded in case of spaces
    :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
  }
end
