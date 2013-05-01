class Ragnarok2MergeNewFeatures20130501 < ActiveRecord::Migration
  def change
    add_column :ragnarok2_skills, :skill_duration, :float
    add_column :ragnarok2_skills, :skill_tick_cycle, :float
    
    add_column :ragnarok2_skill_groups, :be_attacked_cancel, :boolean
    add_column :ragnarok2_skill_groups, :is_auto_direction_switch, :boolean
    
    add_column :ragnarok2_items, :possession_max, :int

    add_column :ragnarok2_quests, :reward_item_id6, :integer, :limit => 8
    add_column :ragnarok2_quests, :reward_item_count6, :integer
    add_column :ragnarok2_quests, :reward_item_id7, :integer, :limit => 8
    add_column :ragnarok2_quests, :reward_item_count7, :integer
  end
end
