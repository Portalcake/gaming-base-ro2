class CreateRagnarok2Kharas < ActiveRecord::Migration
  def change
    create_table :ragnarok2_kharas do |t|

      t.integer :quest_id
      t.integer :quest_type
      t.integer :auto_challenge
      t.integer :board_number
      t.integer :grid_number
      t.integer :icon
      t.integer :reward_npc_id, :limit=>8
      t.integer :pc_job
      t.integer :min_base_level
      t.integer :max_base_level
      t.integer :pc_projob
      t.integer :min_projob_level
      t.integer :max_projob_level
      t.integer :min_khara_point
      t.integer :max_khara_point
      t.integer :giveup
      t.integer :need_quest_id, :limit=>8
      t.integer :need_quest_status
      t.integer :need_khara_point
      t.integer :prohibition_quest_id
      t.integer :need_start_time
      t.integer :need_end_time
      t.integer :quest_flag
      t.integer :limit_time
      t.integer :reward_auto
      t.integer :reward_khara_point
      t.integer :reward_honor_point
      t.integer :reward_title_id
      t.integer :condition_type
      t.integer :condition_value1
      t.integer :condition_value2
      t.integer :condition_value3
      t.integer :error_msg_id, :limit=>8
      t.integer :action_sequence
      t.integer :active_type
      t.integer :action_type
      t.integer :action_value1
      t.integer :action_value2
      t.integer :action_value3
      t.integer :action_value4
      t.integer :action_value5
      t.integer :complete_type
      t.integer :complete_type_value1, :limit=>8
      t.integer :complete_type_value2, :limit=>8
      t.integer :complete_type_value3, :limit=>8
      t.integer :complete_type_value4, :limit=>8
      t.integer :complete_type_value5, :limit=>8
      t.integer :complete_desc_id, :limit=>8
      t.integer :fail_type
      t.integer :fail_type_value1
      t.integer :fail_type_value2
      t.integer :fail_type_value3
      t.integer :fail_type_value4
      t.integer :fail_type_value5
      t.integer :fail_desc_id, :limit=>8

      t.timestamps
    end
    add_index :ragnarok2_kharas, :quest_id
  end
end
