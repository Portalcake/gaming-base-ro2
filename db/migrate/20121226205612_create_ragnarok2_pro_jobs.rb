class CreateRagnarok2ProJobs < ActiveRecord::Migration
  def change
    create_table :ragnarok2_pro_jobs do |t|

      t.integer :pro_job_id, :default=>0, :null=>false
      t.string :protypename
      t.integer :string_protype, :limit => 8
      t.string :proskillname
      t.integer :string_proskill
      t.integer :string_trans_systemmessage
      t.string :trans_spirit_fx_category
      t.integer :start_fx1
      t.integer :loop_fx1
      t.integer :end_fx1
      t.integer :start_fx2
      t.integer :loop_fx2
      t.integer :end_fx2
      t.integer :start_fx3
      t.integer :loop_fx3
      t.integer :end_fx3
      t.integer :trans_buff_skill_id1, :limit => 8
      t.integer :trans_buff_skill_id2, :limit => 8
      t.integer :trans_buff_skill_id3, :limit => 8
      t.integer :trans_skill_id_1
      t.integer :trans_skill_id_2
      t.integer :trans_skill_id_3
      t.integer :trans_skill_id_4
      t.integer :trans_skill_id_5
      t.integer :guide_quest_id1, :limit => 8
      t.integer :guide_quest_id2, :limit => 8
      t.integer :guide_quest_id3, :limit => 8
      t.integer :guide_message_id1
      t.integer :guide_message_id2
      t.integer :guide_message_id3

      t.timestamps
    end

    add_index :ragnarok2_pro_jobs, :pro_job_id, :unique => true
  end
end
