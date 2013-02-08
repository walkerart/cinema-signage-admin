class RenameTypeToStateTypeOnStates < ActiveRecord::Migration
  def change
    rename_column :states, :type, :state_type
  end
end
