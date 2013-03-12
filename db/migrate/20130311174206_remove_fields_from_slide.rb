class RemoveFieldsFromSlide < ActiveRecord::Migration
  def up
    remove_column :slides, :position
    remove_column :slides, :background
    remove_column :slides, :background_file_uid
    remove_column :slides, :background_file_uid
    remove_column :slides, :background_file_name
    remove_column :slides, :background_file_size
  end

  def down
    add_column :slides, :background_file_size, :string
    add_column :slides, :background_file_name, :string
    add_column :slides, :background_file_uid, :string
    add_column :slides, :background_file_uid, :string
    add_column :slides, :background, :string
    add_column :slides, :position, :string
  end
end
