class AddFileNameToPanel < ActiveRecord::Migration
  def change
    add_column :panels, :background_file_name, :string
  end
end
