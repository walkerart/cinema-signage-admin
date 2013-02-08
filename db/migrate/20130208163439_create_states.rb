class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :cinema_id
      t.string :type
      t.timestamps
    end
  end
end
