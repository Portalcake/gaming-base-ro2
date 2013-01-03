class CreateRagnarok2MapDungeons < ActiveRecord::Migration
  def change
    create_table :ragnarok2_map_dungeons do |t|
      t.references :map
      t.references :dungeon

      t.timestamps
    end
    add_index :ragnarok2_map_dungeons, :map_id
    add_index :ragnarok2_map_dungeons, [:dungeon_id, :map_id], :unique => true
  end
end
