class CreateRagnarok2CitizenDropUsers < ActiveRecord::Migration
  def change
    create_table :ragnarok2_citizen_drop_users do |t|
      t.references :citizen_drop
      t.references :user
      t.boolean :approved, :default=>1, :null=>false

      t.timestamps
    end
    add_index :ragnarok2_citizen_drop_users, :citizen_drop_id
    add_index :ragnarok2_citizen_drop_users, :user_id
    add_index :ragnarok2_citizen_drop_users, [:citizen_drop_id, :user_id], :unique => true, :name => :cuid
  end
end
