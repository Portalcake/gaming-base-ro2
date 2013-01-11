class CreateRagnarok2ItemJobs < ActiveRecord::Migration
  def up
    create_table :ragnarok2_item_jobs do |t|
      t.references :item
      t.references :job

      t.timestamps
    end
    add_index :ragnarok2_item_jobs, :item_id
    add_index :ragnarok2_item_jobs, :job_id

    Ragnarok2::Item.all.each {|i| i.send :update_required_joblist, true }
  end

  def down
    drop_table :ragnarok2_item_jobs
  end
end
