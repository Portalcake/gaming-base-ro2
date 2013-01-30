module Ragnarok2
  module MapsHelper

    def ragnarok2_minimap_image_tag(map, opts={})
      link_to image_tag("/games/ro2/maps/minimap_#{map.map_id}.png", opts), "/games/ro2/maps/minimap_#{map.map_id}.png" if File.exists?("#{Rails.root}/public/games/ro2/maps/minimap_#{map.map_id}.png")
    end

  end
end
