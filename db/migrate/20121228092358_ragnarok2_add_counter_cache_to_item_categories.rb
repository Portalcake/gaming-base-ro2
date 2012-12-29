class Ragnarok2AddCounterCacheToItemCategories < ActiveRecord::Migration
  def up
    add_column :ragnarok2_item_categories, :items_count, :integer, :default=>0, :null=>false

    say_with_time "Updating item categories..." do
      Ragnarok2::ItemCategory.reset_column_information
      Ragnarok2::ItemCategory.find_each do |c|
        Ragnarok2::ItemCategory.reset_counters c.id, :items
      end
    end
  end

  def down
    remove_column :ragnarok2_item_categories, :items_count
  end
end
