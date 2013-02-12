class CreateRagnarok2SpawnPoints < ActiveRecord::Migration
  def change
    create_table :ragnarok2_spawn_points do |t|

      t.integer :map_id, :null=>false
      t.float :pos_x, :null=>false
      t.float :pos_y, :null=>false
      t.float :pos_z, :null=>false
      t.integer :citizen_id, :null=>false, :limit=>8
    end

    add_index :ragnarok2_spawn_points, :map_id
    add_index :ragnarok2_spawn_points, :citizen_id
  end
end
