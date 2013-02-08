class RenameTypeToSlideTypeOnSlides < ActiveRecord::Migration
  def change
    rename_column :slides, :type, :slide_type
  end
end
