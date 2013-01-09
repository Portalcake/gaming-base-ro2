class Ragnarok2AddIndicesToTables < ActiveRecord::Migration
  def change
    add_index :ragnarok2_citizens, :string_name_id
    add_index :ragnarok2_citizens, :string_job_name_id
    add_index :ragnarok2_citizens, :min_level
    add_index :ragnarok2_citizens, :max_level

    add_index :ragnarok2_items, :require_level
    add_index :ragnarok2_items, :category_id
    add_index :ragnarok2_items, :string_item_description

    add_index :ragnarok2_merchant_infos, :item_id

    add_index :ragnarok2_quests, :quest_type
    add_index :ragnarok2_quests, :area_id
    add_index :ragnarok2_quests, :recommand_base_level

    add_index :ragnarok2_quest_citizens, :is_start
  end
end
