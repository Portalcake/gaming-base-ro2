class Ragnarok2MergeNewFeatures20130823 < ActiveRecord::Migration
  def up
    remove_index :ragnarok2_upgrade_infos, :need_special_material_id
    remove_column :ragnarok2_upgrade_infos, :need_special_material_id
    remove_column :ragnarok2_upgrade_infos, :need_special_material_amount
    add_column :ragnarok2_skill_groups, :sub_targeting_object, :integer
    add_column :ragnarok2_skill_groups, :targeting_map_id, :string
    add_column :ragnarok2_citizens, :siege_mapid, :integer
  end

  def down
    add_column :ragnarok2_upgrade_infos, :need_special_material_id, :integer
    add_column :ragnarok2_upgrade_infos, :need_special_material_amount,  :integer
    remove_column :ragnarok2_skill_groups, :sub_targeting_object
    remove_column :ragnarok2_skill_groups, :targeting_map_id
    remove_column :ragnarok2_citizens, :siege_mapid
    add_index :ragnarok2_upgrade_infos, :need_special_material_id
  end
end
