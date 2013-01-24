class CreateRagnarok2CraftMaterials < ActiveRecord::Migration
  def change
    create_table :ragnarok2_craft_materials do |t|

      t.integer :craft_info_id, :null=>false
      t.integer :item_id, :limit=>8, :null=>false
      t.integer :material_id, :limit=>8, :null=>false
      t.integer :amount, :default=>1, :null=>false

    end

    add_index :ragnarok2_craft_materials, :craft_info_id
    add_index :ragnarok2_craft_materials, :item_id
    add_index :ragnarok2_craft_materials, :material_id
  end
end
