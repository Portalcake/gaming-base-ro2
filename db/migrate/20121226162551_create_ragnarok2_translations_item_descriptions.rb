class CreateRagnarok2TranslationsItemDescriptions < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_item_descriptions do |t|
      
      t.integer :item_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end
    add_index :ragnarok2_translations_item_descriptions, :item_id, :unique => true, :name => :iid
  end
end
