class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.integer :order
      t.string :background_color
      t.string :background_file_uid
      t.text :text
      t.integer :slide_id

      t.timestamps
    end
  end
end
