class AddBackgroundColorToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :background_color, :string
  end
end
