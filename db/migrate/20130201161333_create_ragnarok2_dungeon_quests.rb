class CreateRagnarok2DungeonQuests < ActiveRecord::Migration
  def change
    create_table :ragnarok2_dungeon_quests do |t|
      
      t.integer :quest_id, :null=>false
      t.integer :dungeon_id
      t.string :mission_name
      t.integer :missiontype1
      t.integer :missionvalue1, :limit=>8
      t.integer :missiontype2
      t.integer :missionvalue2, :limit=>8
      t.integer :missiontype3
      t.integer :missionvalue3, :limit=>8
      t.integer :missiontype4
      t.integer :missionvalue4, :limit=>8
      t.integer :missiontype5
      t.integer :missionvalue5, :limit=>8

      t.timestamps
    end

    add_index :ragnarok2_dungeon_quests, :quest_id, :unique => true
    add_index :ragnarok2_dungeon_quests, :dungeon_id
  end
end
