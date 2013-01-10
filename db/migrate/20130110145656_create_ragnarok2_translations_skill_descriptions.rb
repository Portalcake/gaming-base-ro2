class CreateRagnarok2TranslationsSkillDescriptions < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_skill_descriptions do |t|

      t.integer :skill_id
      t.string :translation
      t.timestamps
    end

    add_index :ragnarok2_translations_skill_descriptions, :skill_id, :unique => true, :name => :sid
  end
end
