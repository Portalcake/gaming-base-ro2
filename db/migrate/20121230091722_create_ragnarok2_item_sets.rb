class CreateRagnarok2ItemSets < ActiveRecord::Migration
  def change
    create_table :ragnarok2_item_sets do |t|

      t.integer :set_id, :default=>0, :null=>false
      t.integer :string_id, :limit=>8, :default=>0, :null=>false
      t.timestamps
    end

    add_index :ragnarok2_item_sets, :set_id, :unique => true
  end
end
