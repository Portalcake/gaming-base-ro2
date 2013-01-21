class Ragnarok2AddIndexToKharaQuestType < ActiveRecord::Migration
  def change
    add_index :ragnarok2_kharas, :quest_type
  end
end
