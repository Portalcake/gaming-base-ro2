class CreateRagnarok2RandomSets < ActiveRecord::Migration
  def change
    create_table :ragnarok2_random_sets do |t|

      t.integer :random_set_id, :null=>false
      t.integer :setbox_type
      t.integer :item_id, :limit => 8, :null=>false
      t.integer :package
      t.integer :ratio
      t.integer :broadcast

    end

    add_index :ragnarok2_random_sets, :random_set_id
    add_index :ragnarok2_random_sets, :item_id
    add_index :ragnarok2_random_sets, :ratio
  end
end
