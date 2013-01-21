class CreateRagnarok2KharaRewardTitles < ActiveRecord::Migration
  def change
    create_table :ragnarok2_khara_reward_titles do |t|

      t.integer :title_id, :null=>false
      t.integer :attribute_str, :default=>0
      t.integer :attribute_dex, :default=>0
      t.integer :attribute_wil, :default=>0
      t.integer :attribute_vit, :default=>0
      t.integer :attribute_int, :default=>0

      t.timestamps
    end

    add_index :ragnarok2_khara_reward_titles, :title_id, :unique=>true
  end
end
