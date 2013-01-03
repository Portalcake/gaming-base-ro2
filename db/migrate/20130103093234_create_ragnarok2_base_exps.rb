class CreateRagnarok2BaseExps < ActiveRecord::Migration
  def change
    create_table :ragnarok2_base_exps do |t|

      t.integer :base_level, :default=>0, :null=>false
      t.integer :base_exp_next, :limit=>8, :default=>0, :null=>false
      t.integer :npc_base_exp, :limit=>8, :default=>0, :null=>false
      t.integer :pro_exp_next, :limit=>8, :default=>0, :null=>false

      t.timestamps
    end

    add_index :ragnarok2_base_exps, :base_level, :unique=>true
  end
end
