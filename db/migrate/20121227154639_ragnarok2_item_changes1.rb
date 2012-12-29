class Ragnarok2ItemChanges1 < ActiveRecord::Migration
  def up
    add_column :ragnarok2_items, :category_id, :integer
    change_column :ragnarok2_items, :string_item_name, :integer, :limit => 8
    change_column :ragnarok2_items, :string_item_description, :integer, :limit => 8
    change_column :ragnarok2_items, :icon, :string
    change_column :ragnarok2_items, :mesh, :string
    change_column :ragnarok2_items, :mesh2, :string
    change_column :ragnarok2_items, :is_drop, :boolean
    change_column :ragnarok2_items, :is_deposit, :boolean
    change_column :ragnarok2_items, :is_destruct, :boolean
    change_column :ragnarok2_items, :is_sell, :boolean
    change_column :ragnarok2_items, :is_trade, :boolean
    change_column :ragnarok2_items, :is_compose, :boolean
  end

  def down
    remove_column :ragnarok2_items, :category_id
    change_column :ragnarok2_items, :string_item_name, :integer
    change_column :ragnarok2_items, :string_item_description, :integer
    change_column :ragnarok2_items, :icon, :integer
    change_column :ragnarok2_items, :mesh, :integer
    change_column :ragnarok2_items, :mesh2, :integer
    change_column :ragnarok2_items, :is_drop, :integer
    change_column :ragnarok2_items, :is_deposit, :integer
    change_column :ragnarok2_items, :is_destruct, :integer
    change_column :ragnarok2_items, :is_sell, :integer
    change_column :ragnarok2_items, :is_trade, :integer
    change_column :ragnarok2_items, :is_compose, :integer
  end
end
