class CreateRagnarok2TranslationsQuests < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_quests do |t|

      t.integer :quest_id, :default=>0, :null=>false, :limit => 8
      t.string :dialog_title
      t.string :quest_title
      t.text :summary_text
      t.text :start_text
      t.text :start_demand
      t.text :retry_text
      t.text :finish_text
      t.text :finish_demand

      t.timestamps
    end

    add_index :ragnarok2_translations_quests, :quest_id, :unique => true
  end
end
