class CreateRagnarok2Items < ActiveRecord::Migration
  def change
    create_table :ragnarok2_items do |t|

      t.integer :item_id, :default=>0, :null=> false, :limit => 8
      t.integer :name_fallback
      t.integer :nationenable
      t.integer :item_type
      t.integer :item_category
      t.integer :grade
      t.integer :price_buy
      t.integer :stack_max
      t.integer :require_level
      t.integer :require_sex
      t.integer :require_job
      t.integer :equip_type
      t.integer :equip_slot
      t.integer :equip_slot_overlap
      t.integer :armor_type
      t.integer :bag_size
      t.integer :bind_type
      t.integer :durability
      t.integer :set_id
      t.integer :randomset_id
      t.integer :socket_max
      t.integer :effect_id_1
      t.integer :skill_id_1
      t.integer :theme_id
      t.integer :is_drop
      t.integer :is_deposit
      t.integer :is_destruct
      t.integer :is_sell
      t.integer :is_trade
      t.integer :is_compose
      t.integer :high_category
      t.integer :medium_category
      t.integer :low_category
      t.integer :string_item_name
      t.integer :string_item_description
      t.integer :mesh
      t.integer :mesh2
      t.integer :default_fx
      t.integer :default_color
      t.integer :color_variation
      t.integer :collisiontype_id
      t.integer :icon

      t.timestamps
    end

    add_index :ragnarok2_items, :item_id, :unique => true
  end
end
