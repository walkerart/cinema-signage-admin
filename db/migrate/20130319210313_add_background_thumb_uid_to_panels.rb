class AddBackgroundThumbUidToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :background_thumb_uid, :string
  end
end
