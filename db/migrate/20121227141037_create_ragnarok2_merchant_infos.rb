class CreateRagnarok2MerchantInfos < ActiveRecord::Migration
  def change
    create_table :ragnarok2_merchant_infos do |t|

      t.integer :entry_id, :default => 0, :null => false
      t.integer :merchant_function_id, :default => 0, :null => false, :limit=>8
      t.integer :buy_type, :default => 0, :null => false
      t.integer :item_id, :default => 0, :null => false, :limit => 8
      t.integer :max, :default => 1, :null => false

      t.timestamps
    end

    add_index :ragnarok2_merchant_infos, :entry_id, :unique => true
    add_index :ragnarok2_merchant_infos, :merchant_function_id
  end
end
