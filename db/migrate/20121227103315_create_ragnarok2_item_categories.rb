class CreateRagnarok2ItemCategories < ActiveRecord::Migration
  def change
    create_table :ragnarok2_item_categories do |t|

      t.integer :category_id, :default=>0, :null=>false
      t.string :name_fallback
      t.integer :string_category_name, :limit=>8
      t.integer :high_category
      t.integer :medium_category
      t.integer :low_category
      t.integer :iconindex

      t.timestamps
    end
  end
end
