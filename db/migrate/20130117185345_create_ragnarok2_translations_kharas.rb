class CreateRagnarok2TranslationsKharas < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_kharas do |t|

      t.integer :quest_id, :default=>0, :null=>false
      t.string :title
      t.string :summary

      t.timestamps
    end

    add_index :ragnarok2_translations_kharas, :quest_id, :unique=>true
  end
end
