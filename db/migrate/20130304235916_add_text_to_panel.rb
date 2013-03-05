class AddTextToPanel < ActiveRecord::Migration
  def change
    add_column :panels, :detail_text, :text
  end
end
