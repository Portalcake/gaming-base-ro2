class CreateRagnarok2ItemUpgradeInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_item_upgrade_infos do |t|

      t.integer :item_id, :limit => 8
      t.integer :upgrade_info_id, :limit => 8
    end

    add_index :ragnarok2_item_upgrade_infos, :item_id
    add_index :ragnarok2_item_upgrade_infos, :upgrade_info_id
  end
end
