class CreateRagnarok2TranslationsItemNames < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_item_names do |t|
      
      t.integer :item_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end
    add_index :ragnarok2_translations_item_names, :item_id, :unique => true, :name => :iid
  end
end
