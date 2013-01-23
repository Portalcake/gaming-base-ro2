class CreateRagnarok2CitizenDrops < ActiveRecord::Migration
  def change
    create_table :ragnarok2_citizen_drops do |t|
      t.references :citizen
      t.references :item
      t.integer :approving_users_count, :default=>0, :null=>false
      t.integer :disapproving_users_count, :default=>0, :null=>false

      t.timestamps
    end
    add_index :ragnarok2_citizen_drops, :citizen_id
    add_index :ragnarok2_citizen_drops, :item_id
    add_index :ragnarok2_citizen_drops, :approving_users_count
    add_index :ragnarok2_citizen_drops, :disapproving_users_count
    add_index :ragnarok2_citizen_drops, [:citizen_id, :item_id], :unqiue => true, :name => :ciid
  end
end
