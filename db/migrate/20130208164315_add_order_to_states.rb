class AddOrderToStates < ActiveRecord::Migration
  def change
    add_column :states, :order, :integer
  end
end
