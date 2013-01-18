class Ragnarok2AddCorrectionLevelAndEquipToMaps < ActiveRecord::Migration
  def change
    add_column :ragnarok2_maps, :correction_level, :integer
    add_column :ragnarok2_maps, :correction_equip, :integer
  end
end
