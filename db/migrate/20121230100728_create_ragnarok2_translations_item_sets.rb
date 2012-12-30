class CreateRagnarok2TranslationsItemSets < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_item_sets do |t|
      t.integer :item_set_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end
    add_index :ragnarok2_translations_item_sets, :item_set_id, :unique => true, :name => :sid
  end
end
