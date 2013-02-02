class CreateRagnarok2CraftScrolls < ActiveRecord::Migration
  def change
    create_table :ragnarok2_craft_scrolls do |t|
      t.integer :item_id, :limit=>8, :null=>false
      t.integer :craft_info_id, :null=>false
    end

    add_index :ragnarok2_craft_scrolls, :item_id
    add_index :ragnarok2_craft_scrolls, :craft_info_id
  end
end
