class CreateRagnarok2Quests < ActiveRecord::Migration
  def change
    create_table :ragnarok2_quests do |t|

      t.integer :quest_id, :default=>0, :null=>false, :limit => 8
      t.integer :quest_type
      t.integer :area_id
      t.integer :start_type
      t.integer :start_type_id, :limit => 8
      t.integer :reward_npc_id, :limit => 8
      t.integer :recommand_base_level
      t.integer :min_base_level
      t.integer :max_base_level
      t.integer :pc_job
      t.integer :pc_projob
      t.integer :min_projob_level
      t.integer :max_projob_level
      t.integer :min_khara_point
      t.integer :max_khara_point
      t.integer :daily_quest
      t.integer :quest_frequency
      t.integer :quest_term
      t.integer :giveup
      t.integer :party
      t.integer :quest_mark
      t.integer :need_quest_id
      t.integer :need_quest_status
      t.integer :next_quest_id
      t.integer :prohibition_quest_id
      t.integer :need_start_time
      t.integer :need_end_time
      t.integer :need_mail_id
      t.integer :quest_flag
      t.integer :waiting_time
      t.integer :reward_auto
      t.integer :reward_money
      t.integer :reward_exp
      t.integer :reward_projob_exp
      t.integer :reward_khara_point
      t.integer :reward_type
      t.integer :reward_item_id1, :limit => 8
      t.integer :reward_item_count1
      t.integer :reward_item_id2, :limit => 8
      t.integer :reward_item_count2
      t.integer :reward_item_id3, :limit => 8
      t.integer :reward_item_count3
      t.integer :reward_item_id4, :limit => 8
      t.integer :reward_item_count4
      t.integer :reward_item_id5, :limit => 8
      t.integer :reward_item_count5
      t.integer :reward_skill_id, :limit => 8
      t.integer :condition_type
      t.integer :condition_value1
      t.integer :condition_value2
      t.integer :condition_value3
      t.integer :error_msg_id, :limit => 8
      t.integer :action_sequence
      t.integer :active_type
      t.integer :action_type
      t.integer :action_value1
      t.integer :action_value2
      t.integer :action_value3
      t.integer :action_value4
      t.integer :action_value5
      t.integer :complete_type
      t.integer :complete_type_value1
      t.integer :complete_type_value2
      t.integer :complete_type_value3
      t.integer :complete_type_value4
      t.integer :complete_type_value5
      t.integer :complete_desc_id, :limit => 8
      t.integer :trace_id
      t.integer :fail_type
      t.integer :fail_type_value1
      t.integer :fail_type_value2
      t.integer :fail_type_value3
      t.integer :fail_type_value4
      t.integer :fail_type_value5
      t.integer :fail_desc_id

      t.timestamps
    end

    add_index :ragnarok2_quests, :quest_id, :unique=>true
  end
end
