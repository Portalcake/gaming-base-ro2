class CreateRagnarok2Citizens < ActiveRecord::Migration
  def change
    create_table :ragnarok2_citizens do |t|

      t.integer :citizen_id, :default => 0, :null => false, :limit => 8
      t.integer :string_name_id, :limit => 8
      t.integer :nationenable
      t.integer :string_job_name_id, :limit => 8
      t.integer :camp
      t.integer :legion
      t.integer :min_level
      t.integer :max_level
      t.integer :faction
      t.integer :closeup
      t.integer :direction_lock
      t.integer :family
      t.integer :grade
      t.integer :race
      t.integer :growth_type
      t.integer :element
      t.integer :nature_1
      t.integer :nature_2
      t.integer :nature_3
      t.integer :radius
      t.integer :shape_type
      t.integer :corpse_disappear_time
      t.integer :drop_id
      t.integer :base_exp_multiplier
      t.integer :lisence_exp_multiplier
      t.integer :resist_point
      t.integer :water_resist
      t.integer :earth_resist
      t.integer :fire_resist
      t.integer :wind_resist
      t.integer :poison_resist
      t.integer :saint_resist
      t.integer :dark_resist
      t.integer :psychokinesis_resist
      t.integer :death_resist
      t.integer :walk_speed
      t.integer :run_speed
      t.integer :run_correction
      t.integer :idle_move_rate
      t.integer :min_move_action_time
      t.integer :max_move_action_time
      t.integer :idle_action_rate
      t.integer :min_idle_action_time
      t.integer :max_idle_action_time
      t.integer :monologue_action_rate
      t.integer :string_monologue_id
      t.integer :min_monologue_action_time
      t.integer :max_monologue_action_time
      t.integer :task_action_rate
      t.integer :min_task_action_time
      t.integer :max_task_action_time
      t.integer :function_type_1
      t.integer :function_id_1
      t.integer :function_type_2
      t.integer :function_id_2
      t.integer :function_type_3
      t.integer :function_id_3
      t.integer :npc_voice_type
      t.integer :invincibility
      t.integer :spawn_freeze_time
      t.integer :patience
      t.integer :pain_grade
      t.integer :threat_reaction_point
      t.integer :aggro_target_selection_type
      t.integer :reaction_bound
      t.integer :follow_groupid
      t.integer :follow_group_captain
      t.integer :follow_pc
      t.integer :follow_distance
      t.integer :attack_range
      t.integer :attack_execution_time
      t.integer :attack_cooldown_time
      t.integer :trace_bound
      t.integer :spreadaggro
      t.integer :spreadaggrotype
      t.integer :battle_start
      t.integer :attack_time
      t.integer :steal_groupid
      t.integer :pet_id
      t.integer :afterdeath_funcobject_id
      t.integer :attacklimit
      t.integer :skillgroup
      t.integer :ability_1
      t.integer :ability_2
      t.integer :ability_3
      t.integer :ability_4
      t.integer :ability_5
      t.integer :legion_inheritance
      t.integer :looting_mode
      t.integer :personal_reward
      t.integer :pvp_point

      t.timestamps
    end

    add_index :ragnarok2_citizens, :citizen_id, :unique => true
  end
end
