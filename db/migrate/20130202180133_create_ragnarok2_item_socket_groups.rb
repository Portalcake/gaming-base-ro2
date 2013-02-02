class CreateRagnarok2ItemSocketGroups < ActiveRecord::Migration
  def change
    create_table :ragnarok2_item_socket_groups do |t|
      
      t.integer :socket_group_id, :null=>false
      t.integer :socket_type1
      t.integer :string_socket_name1
      t.string :close_icon1
      t.string :open_icon1
      t.integer :socket_type2
      t.integer :string_socket_name2
      t.string :close_icon2
      t.string :open_icon2
      t.integer :socket_type3
      t.integer :string_socket_name3
      t.string :close_icon3
      t.string :open_icon3
      t.integer :socket_type4
      t.integer :string_socket_name4
      t.string :close_icon4
      t.string :open_icon4
      t.integer :socket_type5
      t.integer :string_socket_name5
      t.string :close_icon5
      t.string :open_icon5

      t.timestamps
    end

    add_index :ragnarok2_item_socket_groups, :socket_group_id, :unique=>true
  end
end
