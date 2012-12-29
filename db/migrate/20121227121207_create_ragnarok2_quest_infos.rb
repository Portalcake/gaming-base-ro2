class CreateRagnarok2QuestInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_quest_infos do |t|

      t.integer :quest_id, :default=>0, :null=>false, :limit => 8
      t.integer :area_id_1
      t.integer :complete_target_1
      t.integer :target_id_1, :limit => 8
      t.integer :target_x_1
      t.integer :target_y_1
      t.integer :area_id_2
      t.integer :complete_target_2
      t.integer :target_id_2, :limit => 8
      t.integer :target_x_2
      t.integer :target_y_2
      t.integer :area_id_3
      t.integer :complete_target_3
      t.integer :target_id_3, :limit => 8
      t.integer :target_x_3
      t.integer :target_y_3
      t.integer :area_id_4
      t.integer :complete_target_4
      t.integer :target_id_4, :limit => 8
      t.integer :target_x_4
      t.integer :target_y_4
      t.integer :area_id_5
      t.integer :complete_target_5
      t.integer :target_id_5, :limit => 8
      t.integer :target_x_5
      t.integer :target_y_5
      t.integer :area_id_6
      t.integer :complete_target_6
      t.integer :target_id_6, :limit => 8
      t.integer :target_x_6
      t.integer :target_y_6
      t.integer :area_id_7
      t.integer :complete_target_7
      t.integer :target_id_7, :limit => 8
      t.integer :target_x_7
      t.integer :target_y_7
      t.integer :area_id_8
      t.integer :complete_target_8
      t.integer :target_id_8, :limit => 8
      t.integer :target_x_8
      t.integer :target_y_8
      t.integer :area_id_9
      t.integer :complete_target_9
      t.integer :target_id_9, :limit => 8
      t.integer :target_x_9
      t.integer :target_y_9
      t.integer :area_id_10
      t.integer :complete_target_10
      t.integer :target_id_10, :limit => 8
      t.integer :target_x_10
      t.integer :target_y_10


      t.timestamps
    end
    add_index :ragnarok2_quest_infos, :quest_id

  end
end
