class CreateRagnarok2Dungeons < ActiveRecord::Migration
  def change
    create_table :ragnarok2_dungeons do |t|

      t.integer :dungeon_id, :default=>0, :null=>false
      t.integer :map_index1, :limit => 8
      t.integer :map_index2, :limit => 8
      t.integer :map_index3, :limit => 8
      t.integer :dungeon_group_id
      t.string :name
      t.integer :map_level
      t.string :bind_value
      t.integer :map_min_level
      t.integer :map_max_level
      t.integer :quest_id, :limit => 8
      t.string :map_description
      t.integer :position_id

      t.timestamps
    end
    add_index :ragnarok2_dungeons, :dungeon_id, :unique => true
    add_index :ragnarok2_dungeons, :quest_id
  end
end
