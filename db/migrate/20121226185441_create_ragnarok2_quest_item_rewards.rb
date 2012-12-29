class CreateRagnarok2QuestItemRewards < ActiveRecord::Migration
  def change
    create_table :ragnarok2_quest_item_rewards do |t|
      t.references :quest, :limit => 8
      t.references :item, :limit => 8
      t.integer :amount, :default => 0, :null => false

      t.timestamps
    end

    add_index :ragnarok2_quest_item_rewards, :quest_id
    add_index :ragnarok2_quest_item_rewards, :item_id
  end
end
