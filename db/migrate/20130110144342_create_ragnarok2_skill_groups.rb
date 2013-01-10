class CreateRagnarok2SkillGroups < ActiveRecord::Migration
  def change
    create_table :ragnarok2_skill_groups do |t|

      t.integer :skill_group, :null=>false, :limit=>8
      t.string :name_fallback
      t.string :skill_icon
      t.integer :ui_property
      t.integer :check_learn_skill
      t.integer :battle_start
      t.integer :summon_object
      t.integer :max_level
      t.integer :cooltime_group
      t.integer :skill_damage_base
      t.integer :skill_damage_add
      t.integer :skill_damagerate_base
      t.integer :skill_damagerate_add
      t.integer :skill_type
      t.integer :skill_function
      t.float :func_parameter_1
      t.float :func_parameter_2
      t.float :func_parameter_3
      t.integer :icon_type
      t.integer :skill_property
      t.integer :skill_element_type
      t.integer :need_base_level
      t.integer :need_skill_up_level
      t.integer :need_before_skill_id_1, :limit=>8
      t.integer :need_before_skill_id_2, :limit=>8
      t.integer :need_before_skill_id_3, :limit=>8
      t.integer :targeting_object
      t.integer :targeting_actor_id
      t.integer :equip_weapon
      t.integer :use_weapon
      t.boolean :is_jump_use
      t.boolean :is_movable
      t.boolean :is_move_stop
      t.integer :battle_state_change
      t.integer :use_battle
      t.integer :caster_status
      t.integer :target_status
      t.integer :skill_min_range
      t.integer :skill_range
      t.integer :use_trans_time
      t.integer :casting_bar_type
      t.integer :special_cast_basis
      t.integer :influence_target_type
      t.integer :influence_bound_shape
      t.float :influence_bound_length
      t.float :influence_bound_width
      t.float :attack_time

      t.timestamps
    end

    add_index :ragnarok2_skill_groups, :skill_group, :unique => true
    add_index :ragnarok2_skill_groups, :name_fallback
  end
end
