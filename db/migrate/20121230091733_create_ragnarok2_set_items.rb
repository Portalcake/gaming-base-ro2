class CreateRagnarok2SetItems < ActiveRecord::Migration
  def change
    create_table :ragnarok2_set_items do |t|

      t.references :item_set, :default=>0, :null=>false
      t.integer :item_1_id, :default=>0, :null=>false
      t.integer :item_2_id
      t.timestamps
    end

    add_index :ragnarok2_set_items, :item_set_id
    add_index :ragnarok2_set_items, :item_1_id
    add_index :ragnarok2_set_items, :item_2_id
  end
end
