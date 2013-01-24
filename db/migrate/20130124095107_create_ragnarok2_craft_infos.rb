class CreateRagnarok2CraftInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_craft_infos do |t|

      t.integer :craft_info_id, :null=>false
      t.integer :craft_learntype
      t.integer :protype_id
      t.integer :craft_itemtype_id
      t.integer :craft_item_id, :limit=>8
      t.integer :craft_item_amount
      t.integer :craft_level
      t.integer :craft_needsp
      t.integer :craftexp
      t.integer :crafttime_sec
      t.integer :cooltime_min
      t.integer :positiongroup
      t.integer :learn_needmoney

      t.timestamps
    end

    add_index :ragnarok2_craft_infos, :craft_info_id, :unique => true
    add_index :ragnarok2_craft_infos, :craft_item_id
  end
end
