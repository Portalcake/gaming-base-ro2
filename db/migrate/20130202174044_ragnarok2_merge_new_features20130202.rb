class Ragnarok2MergeNewFeatures20130202 < ActiveRecord::Migration
  def change
    add_column :ragnarok2_items, :socket_groupid, :integer
  end
end
