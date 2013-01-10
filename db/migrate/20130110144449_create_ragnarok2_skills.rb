class CreateRagnarok2Skills < ActiveRecord::Migration
  def change
    create_table :ragnarok2_skills do |t|

      t.integer :skill_id, :limit=>8
      t.string :name_fallback
      t.integer :skill_group_id, :limit=>8
      t.integer :skill_level
      t.integer :need_skill_money
      t.integer :create_item_id
      t.integer :number_of_create_item
      t.integer :spended_item_id
      t.integer :number_of_spended_item
      t.integer :use_sp
      t.integer :use_hp
      t.float :casting_time
      t.float :minimum_casting_time
      t.float :excution_time
      t.float :cooldown_time
      t.float :effect_duration
      t.float :tick_interval
      t.integer :number_of_normal_influences
      t.integer :number_of_success_influences
      t.integer :skill_damage_quantity
      t.integer :addaggro
      t.integer :addaggrorate
      t.float :aggrorange
      t.integer :string_skill_name, :limit=>8
      t.integer :string_skill_description, :limit=>8

      t.timestamps
    end

    add_index :ragnarok2_skills, :skill_id, :unique=>true
    add_index :ragnarok2_skills, :skill_group_id
    add_index :ragnarok2_skills, :skill_level
    add_index :ragnarok2_skills, :string_skill_name
    add_index :ragnarok2_skills, :string_skill_description
  end
end
