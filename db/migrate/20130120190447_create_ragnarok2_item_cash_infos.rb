class CreateRagnarok2ItemCashInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_item_cash_infos do |t|

      t.integer :item_id, :default=>0, :null=>false, :limit=>8
      t.integer :cash_type
      t.integer :content_type
      t.integer :duration_type
      t.integer :duration_value
      t.integer :duration_extend_group_id

      t.timestamps
    end

    add_index :ragnarok2_item_cash_infos, :item_id, :unique=>true
  end
end
