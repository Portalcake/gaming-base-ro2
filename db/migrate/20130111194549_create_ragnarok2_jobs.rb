class CreateRagnarok2Jobs < ActiveRecord::Migration
  def change
    create_table :ragnarok2_jobs do |t|

      t.integer :job_id, :null=>false
      t.string :name_fallback
      t.integer :string_job_name, :limit=>8
      t.integer :string_job_description, :limit=>8
      t.integer :job_category
      t.integer :job_type
      t.integer :base_job_id
      t.integer :arm_length
      t.float :global_cooldown_time
      t.integer :threat_modifier
      t.integer :job_color

      t.timestamps
    end

    add_index :ragnarok2_jobs, :job_id, :unique=>true
    add_index :ragnarok2_jobs, :string_job_name
    add_index :ragnarok2_jobs, :string_job_description
  end
end
