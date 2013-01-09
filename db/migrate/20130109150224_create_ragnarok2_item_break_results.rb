class CreateRagnarok2ItemBreakResults < ActiveRecord::Migration
  def up
    create_table :ragnarok2_item_break_results do |t|
      t.integer :result_id
      t.integer :grade
      t.integer :needed_item_id, :limit => 8
      t.integer :needed_item_amount
      t.integer :result_item_1_id, :limit => 8
      t.integer :result_item_1_amount
      t.integer :result_item_1_rate
      t.integer :result_item_2_id, :limit => 8
      t.integer :result_item_2_amount
      t.integer :result_item_2_rate
    end

    add_index :ragnarok2_item_break_results, :result_id
    add_column :ragnarok2_items, :item_break_result_id, :integer
  end

  def down
    drop_table :ragnarok2_item_break_results
    remove_column :ragnarok2_items, :item_break_result_id
  end
end
