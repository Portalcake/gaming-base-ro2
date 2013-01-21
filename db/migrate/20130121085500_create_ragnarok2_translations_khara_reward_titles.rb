class CreateRagnarok2TranslationsKharaRewardTitles < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_khara_reward_titles do |t|

      t.integer :title_id, :null=>false
      t.string :title
      t.string :description_short
      t.string :description_long
      
      t.timestamps
    end
    add_index :ragnarok2_translations_khara_reward_titles, :title_id, :unique=>true
  end
end
