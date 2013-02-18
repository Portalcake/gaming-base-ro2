class CreateRagnarok2UpgradeInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_upgrade_infos do |t|

      t.integer :result_id, :limit => 8
      t.integer :upgrade_level
      t.integer :normalabilityuppercent
      t.integer :need_zenny
      t.integer :need_normal_material_id, :limit => 8
      t.integer :need_normal_material_amount
      t.integer :normalenforcerate
      t.integer :normalenforcesuccess
      t.integer :normalenforcefailed
      t.integer :need_special_material_id, :limit => 8
      t.integer :need_special_material_amount
      t.integer :specialenforcerate
      t.integer :specialenforcesuccess
      t.integer :specialenforcefailed

    end

    add_index :ragnarok2_upgrade_infos, :result_id
    add_index :ragnarok2_upgrade_infos, :upgrade_level
    add_index :ragnarok2_upgrade_infos, :need_normal_material_id
    add_index :ragnarok2_upgrade_infos, :need_special_material_id
  end
end
