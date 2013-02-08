class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.integer :state_id
      t.integer :position
      t.string :type
      t.string :text
      t.string :background

      t.timestamps
    end
  end
end
