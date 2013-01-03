class Ragnarok2IntegerToFloat < ActiveRecord::Migration
  def up
    change_column :ragnarok2_citizens, :base_exp_multiplier, :float
    change_column :ragnarok2_citizens, :lisence_exp_multiplier, :float
    change_column :ragnarok2_citizens, :walk_speed, :float
    change_column :ragnarok2_citizens, :run_speed, :float
    change_column :ragnarok2_citizens, :run_correction, :float
    change_column :ragnarok2_citizens, :min_move_action_time, :float
    change_column :ragnarok2_citizens, :max_move_action_time, :float
    change_column :ragnarok2_citizens, :min_idle_action_time, :float
    change_column :ragnarok2_citizens, :max_idle_action_time, :float
    change_column :ragnarok2_citizens, :min_monologue_action_time, :float
    change_column :ragnarok2_citizens, :max_monologue_action_time, :float
    change_column :ragnarok2_citizens, :min_task_action_time, :float
    change_column :ragnarok2_citizens, :max_task_action_time, :float
    change_column :ragnarok2_citizens, :spawn_freeze_time, :float
    change_column :ragnarok2_citizens, :reaction_bound, :float
    change_column :ragnarok2_citizens, :follow_distance, :float
    change_column :ragnarok2_citizens, :attack_range, :float
    change_column :ragnarok2_citizens, :attack_execution_time, :float
    change_column :ragnarok2_citizens, :attack_cooldown_time, :float
    change_column :ragnarok2_citizens, :trace_bound, :float
    change_column :ragnarok2_citizens, :battle_start, :float
    change_column :ragnarok2_citizens, :attack_time, :float
    change_column :ragnarok2_citizens, :attacklimit, :float

    change_column :ragnarok2_maps, :x, :float
    change_column :ragnarok2_maps, :y, :float
    change_column :ragnarok2_maps, :z, :float

    change_column :ragnarok2_quest_infos, :target_x_1, :float
    change_column :ragnarok2_quest_infos, :target_y_1, :float
    change_column :ragnarok2_quest_infos, :target_x_2, :float
    change_column :ragnarok2_quest_infos, :target_y_2, :float
    change_column :ragnarok2_quest_infos, :target_x_3, :float
    change_column :ragnarok2_quest_infos, :target_y_3, :float
    change_column :ragnarok2_quest_infos, :target_x_4, :float
    change_column :ragnarok2_quest_infos, :target_y_4, :float
    change_column :ragnarok2_quest_infos, :target_x_5, :float
    change_column :ragnarok2_quest_infos, :target_y_5, :float
    change_column :ragnarok2_quest_infos, :target_x_6, :float
    change_column :ragnarok2_quest_infos, :target_y_6, :float
    change_column :ragnarok2_quest_infos, :target_x_7, :float
    change_column :ragnarok2_quest_infos, :target_y_7, :float
    change_column :ragnarok2_quest_infos, :target_x_8, :float
    change_column :ragnarok2_quest_infos, :target_y_8, :float
    change_column :ragnarok2_quest_infos, :target_x_9, :float
    change_column :ragnarok2_quest_infos, :target_y_9, :float
    change_column :ragnarok2_quest_infos, :target_x_10, :float
    change_column :ragnarok2_quest_infos, :target_y_10, :float
  end

  def down
    change_column :ragnarok2_citizens, :base_exp_multiplier, :integer
    change_column :ragnarok2_citizens, :lisence_exp_multiplier, :integer
    change_column :ragnarok2_citizens, :walk_speed, :integer
    change_column :ragnarok2_citizens, :run_speed, :integer
    change_column :ragnarok2_citizens, :run_correction, :integer
    change_column :ragnarok2_citizens, :min_move_action_time, :integer
    change_column :ragnarok2_citizens, :max_move_action_time, :integer
    change_column :ragnarok2_citizens, :min_idle_action_time, :integer
    change_column :ragnarok2_citizens, :max_idle_action_time, :integer
    change_column :ragnarok2_citizens, :min_monologue_action_time, :integer
    change_column :ragnarok2_citizens, :max_monologue_action_time, :integer
    change_column :ragnarok2_citizens, :min_task_action_time, :integer
    change_column :ragnarok2_citizens, :max_task_action_time, :integer
    change_column :ragnarok2_citizens, :spawn_freeze_time, :integer
    change_column :ragnarok2_citizens, :reaction_bound, :integer
    change_column :ragnarok2_citizens, :follow_distance, :integer
    change_column :ragnarok2_citizens, :attack_range, :integer
    change_column :ragnarok2_citizens, :attack_execution_time, :integer
    change_column :ragnarok2_citizens, :attack_cooldown_time, :integer
    change_column :ragnarok2_citizens, :trace_bound, :integer
    change_column :ragnarok2_citizens, :battle_start, :integer
    change_column :ragnarok2_citizens, :attack_time, :integer
    change_column :ragnarok2_citizens, :attacklimit, :integer

    change_column :ragnarok2_maps, :x, :integer
    change_column :ragnarok2_maps, :y, :integer
    change_column :ragnarok2_maps, :z, :integer

    change_column :ragnarok2_quest_infos, :target_x_1, :integer
    change_column :ragnarok2_quest_infos, :target_y_1, :integer
    change_column :ragnarok2_quest_infos, :target_x_2, :integer
    change_column :ragnarok2_quest_infos, :target_y_2, :integer
    change_column :ragnarok2_quest_infos, :target_x_3, :integer
    change_column :ragnarok2_quest_infos, :target_y_3, :integer
    change_column :ragnarok2_quest_infos, :target_x_4, :integer
    change_column :ragnarok2_quest_infos, :target_y_4, :integer
    change_column :ragnarok2_quest_infos, :target_x_5, :integer
    change_column :ragnarok2_quest_infos, :target_y_5, :integer
    change_column :ragnarok2_quest_infos, :target_x_6, :integer
    change_column :ragnarok2_quest_infos, :target_y_6, :integer
    change_column :ragnarok2_quest_infos, :target_x_7, :integer
    change_column :ragnarok2_quest_infos, :target_y_7, :integer
    change_column :ragnarok2_quest_infos, :target_x_8, :integer
    change_column :ragnarok2_quest_infos, :target_y_8, :integer
    change_column :ragnarok2_quest_infos, :target_x_9, :integer
    change_column :ragnarok2_quest_infos, :target_y_9, :integer
    change_column :ragnarok2_quest_infos, :target_x_10, :integer
    change_column :ragnarok2_quest_infos, :target_y_10, :integer
  end
end
