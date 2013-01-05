class CreateRagnarok2TranslationsTraitNames < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_trait_names do |t|
      t.integer :trait_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end
    add_index :ragnarok2_translations_trait_names, :trait_id, :unique => true, :name => :tid
  end
end
