class MoveBackgroundColorToState < ActiveRecord::Migration
  def change
    add_column :states, :background_color, :string
    remove_column :slides, :background_color
  end
end
