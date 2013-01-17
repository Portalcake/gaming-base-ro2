class CreateRagnarok2KharaTitles < ActiveRecord::Migration
  def change
    create_table :ragnarok2_khara_titles do |t|

      t.integer :title_id, :default=>0, :null=>false
      t.integer :grade_type
      t.integer :option_1, :limit=>8
      t.integer :option_2, :limit=>8
      t.integer :option_3, :limit=>8
      t.integer :string_title_name_id
      t.integer :string_title_description_id
      t.integer :string_title_detail_desc_id
      t.string :emblem_path

      t.timestamps
    end

    add_index :ragnarok2_khara_titles, :title_id, :unique=>true
  end
end
