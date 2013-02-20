class AddBackgroundFieldsToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :background_color, :string
    add_column :slides, :background_file_uid, :string
  end
end
