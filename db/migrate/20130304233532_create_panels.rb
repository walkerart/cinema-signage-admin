class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :background_color
      t.integer :order
      t.integer :slide_id
      t.string :background_image_uid

      t.timestamps
    end
  end
end
