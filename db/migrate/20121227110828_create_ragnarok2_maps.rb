class CreateRagnarok2Maps < ActiveRecord::Migration
  def change
    create_table :ragnarok2_maps do |t|

      t.integer :map_id, :default => 0, :null => false
      t.string :name
      t.string :map_file
      t.integer :map_type
      t.integer :max_count
      t.integer :x
      t.integer :y
      t.integer :z
      t.integer :is_pk
      t.integer :is_mount
      t.integer :is_attack
      t.integer :is_skill
      t.integer :is_chat_log
      t.integer :base_exp
      t.integer :effect_id
      t.integer :contents_ver

      t.timestamps
    end
    add_index :ragnarok2_maps, :map_id, :unique => true
  end
end
