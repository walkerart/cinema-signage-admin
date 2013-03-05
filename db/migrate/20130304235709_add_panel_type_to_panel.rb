class AddPanelTypeToPanel < ActiveRecord::Migration
  def change
    add_column :panels, :panel_type, :string
  end
end
