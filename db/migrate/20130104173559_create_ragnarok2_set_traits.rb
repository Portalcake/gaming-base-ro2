class CreateRagnarok2SetTraits < ActiveRecord::Migration
  def change
    create_table :ragnarok2_set_traits do |t|

      t.integer :set_id, :null=>false
      t.integer :trait_kind
      t.integer :trait_type
      t.float :trait_value
      t.integer :amount
      t.timestamps
    end
    add_index :ragnarok2_set_traits, :set_id
  end
end
