class CreateRagnarok2TranslationsJobNames < ActiveRecord::Migration
  def change
    create_table :ragnarok2_translations_job_names do |t|
      
      t.integer :job_id, :default => 0, :null => false, :limit => 8
      t.string :translation

      t.timestamps
    end
    add_index :ragnarok2_translations_job_names, :job_id, :unique => true, :name => :jid
  end
end
