module Ragnarok2::ApplicationHelper
  def ragnarok2_build_page_navigation
    Proc.new do |primary|
      primary.item :quests, "Quests", quests_path, :highlights_on=>/ro2\/[a-z]{2}\/quests/
      primary.item :cititzens, "NPCs", citizens_path, :highlights_on=>/ro2\/[a-z]{2}\/citizens/
      primary.item :items, "Items", items_path, :highlights_on=>/ro2\/[a-z]{2}\/items/ do |i|
        i.item :items, "All items", items_path, :highlights_on=>/ro2\/[a-z]{2}\/items\/?$/
        Ragnarok2::ItemCategory.not_empty.all.each do |item_category|
          i.item item_category.category_id,
                  item_category.to_s,
                  url_for(item_category),
                  :highlights_on=>Regexp.new("/ro2/[a-z]{2}/item_categories/#{item_category.id}-")
        end
      end
      primary.item :set_items, "Item Sets", item_sets_path, :highlights_on=>/ro2\/[a-z]{2}\/item_sets/
      primary.item :maps, "Maps", maps_path, :highlights_on=>/ro2\/[a-z]{2}\/maps/

    end
  end

  def ragnarok2_icon_image_tag(icon, opts={})
    image_tag("games/ro2/icons/#{icon}.png", :alt=>opts[:alt])
  end
end
