class CreateRagnarok2QuestCitizens < ActiveRecord::Migration
  def change
    create_table :ragnarok2_quest_citizens do |t|

      t.references :citizen, :limit => 8
      t.references :quest, :limit => 8
      t.boolean :is_start
      
    end
    add_index :ragnarok2_quest_citizens, :citizen_id
    add_index :ragnarok2_quest_citizens, :quest_id
  end
end
