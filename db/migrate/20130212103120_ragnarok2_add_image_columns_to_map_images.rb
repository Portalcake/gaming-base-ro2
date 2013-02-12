class Ragnarok2AddImageColumnsToMapImages < ActiveRecord::Migration
  def up
    add_attachment :ragnarok2_map_images, :image
  end

  def down
    remove_attachment :ragnarok2_map_images, :image
  end
end
