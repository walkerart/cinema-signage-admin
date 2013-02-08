class CreateCinemas < ActiveRecord::Migration
  def change
    create_table :cinemas do |t|
      t.string :title
      t.string :link
      t.string :description

      t.timestamps
    end
  end
end
