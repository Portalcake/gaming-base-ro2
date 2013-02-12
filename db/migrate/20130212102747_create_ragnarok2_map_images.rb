class CreateRagnarok2MapImages < ActiveRecord::Migration
  def change
    create_table :ragnarok2_map_images do |t|
      t.integer :map_id, :null=>false
      t.integer :map_part
    end

    add_index :ragnarok2_map_images, :map_id
  end
end
