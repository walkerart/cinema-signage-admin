class AddBackgroundFileNameToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :background_file_name, :string
    add_column :slides, :background_file_size, :integer
  end
end
