class CreateRagnarok2CitizenItems < ActiveRecord::Migration
  def change
    create_table :ragnarok2_citizen_items do |t|

      t.references :citizen, :default=>0, :null=>false, :limit => 8
      t.references :item, :default=>0, :null=>false, :limit => 8
      t.integer :max, :default=>1, :null=>false
      t.integer :buy_type, :default=>0, :null=>false

      t.timestamps
    end

    add_index :ragnarok2_citizen_items, :citizen_id
    add_index :ragnarok2_citizen_items, :item_id
  end
end
