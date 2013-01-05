class CreateRagnarok2Traits < ActiveRecord::Migration
  def change
    create_table :ragnarok2_traits do |t|

      t.references :item, :null=>false
      t.integer :nationenable
      t.integer :trait_kind
      t.integer :trait_type
      t.float :trait_value1
      t.float :trait_value2
      t.integer :option_set

      t.timestamps
    end
    add_index :ragnarok2_traits, :item_id
  end
end
