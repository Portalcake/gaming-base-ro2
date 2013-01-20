class Ragnarok2AddIndicesForItemCategories < ActiveRecord::Migration
  def up
    add_index :ragnarok2_items, [:high_category_id, :medium_category_id, :low_category_id], :name => :categories_indices
    add_index :ragnarok2_item_categories, [:high_category, :medium_category, :low_category], :name => :categories_indices, :unique => true
  end
end
