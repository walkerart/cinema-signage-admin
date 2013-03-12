class RemoveMoreFieldsFromSlide < ActiveRecord::Migration
  def up
    remove_column :slides, :slide_type
    remove_column :slides, :text
    remove_column :slides, :background_color
  end

  def down
    add_column :slides, :background_color, :string
    add_column :slides, :text, :string
    add_column :slides, :slide_type, :string
  end
end
