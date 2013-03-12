require 'dragonfly'
require 'dragonfly/rails/images'

module S3

  def self.apply_configuration(app, *args)
    app.configure_with :rails
    app.configure_with :imagemagick
    app.configure do |c|
      c.datastore = Dragonfly::DataStorage::S3DataStore.new
      c.datastore.configure do |c|
        c.access_key_id     = ENV['AWS_ACCESS_KEY_ID']
        c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
      end
      c.job :thumb do |geometry, format|
        process :thumb, geometry
        encode format if format
      end
    end
  end

end

cinema_wall = Dragonfly[:images]
cinema_wall.configure_with(S3) do |c|
  c.datastore.configure do |store|
    store.bucket_name = 'cinema-wall'
    store.storage_headers = {
                'x-amz-acl' => 'public-read',
                'Cache-Control' => 'max-age=315576000',
                "x-rails-environment" => Rails.env}
  end
end
cinema_wall.define_macro(ActiveRecord::Base, :file_accessor)
