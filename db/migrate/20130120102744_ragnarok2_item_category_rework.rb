class Ragnarok2ItemCategoryRework < ActiveRecord::Migration
  def up
    rename_column :ragnarok2_items, :high_category, :high_category_id
    rename_column :ragnarok2_items, :medium_category, :medium_category_id
    rename_column :ragnarok2_items, :low_category, :low_category_id
    remove_column :ragnarok2_items, :category_id
  end

  def down
    rename_column :ragnarok2_items, :high_category, :high_category_id
    rename_column :ragnarok2_items, :medium_category, :medium_category_id
    rename_column :ragnarok2_items, :low_category, :low_category_id
    add_column :ragnarok2_items, :category_id, :integer
    add_index :ragnarok2_items, :category_id
  end
end
