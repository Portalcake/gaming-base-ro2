module Ragnarok2::ApplicationHelper
  def ragnarok2_build_page_navigation
    Proc.new do |primary|
      primary.item :news, "News", news_index_path, :highlights_on=>/ro2\/[a-z]{2}\/news/
      primary.item :forum, "Forum", forum.topics_path
      primary.item :placeholder_news, "", :class => :placeholder
      primary.item :quests, "Quests", quests_path, :highlights_on=>/ro2\/[a-z]{2}\/quests/
      primary.item :khara, "Khara", kharas_path, :highlights_on=>/ro2\/[a-z]{2}\/kharas/
      primary.item :cititzens, "NPCs", citizens_path, :highlights_on=>/ro2\/[a-z]{2}\/citizens/
      primary.item :items, "Items", items_path, :highlights_on=>/ro2\/[a-z]{2}\/items/ do |i|
        i.item :items, "All items", items_path, :highlights_on=>/ro2\/[a-z]{2}\/items\/?$/
        i.item :placeholder_items, "", :class => :placeholder


        item_categories = Ragnarok2::ItemCategory.all
        
        high_item_categories = item_categories.select{|c| c.medium_category.zero? && c.low_category.zero?}

        high_item_categories.each do |category|
          i.item category.category_id,
            category.to_s.pluralize,
            url_for(category),
            :highlights_on=>Regexp.new("/ro2/[a-z]{2}/item_categories/#{category.id}-") do |i2|

              medium_item_categories = item_categories.select{|c| c.high_category == category.high_category && !c.medium_category.zero? && c.low_category.zero?}

              medium_item_categories.each do |category|
                i2.item category.category_id,
                  category.to_s.pluralize,
                  url_for(category),
                  :highlights_on=>Regexp.new("/ro2/[a-z]{2}/item_categories/#{category.id}-") do |i3|

                    low_item_categories = item_categories.select{|c| c.high_category == category.high_category && c.medium_category == category.medium_category && !c.low_category.zero?}

                    low_item_categories.each do |category|
                      i3.item category.category_id,
                        category.to_s.pluralize,
                        url_for(category),
                        :highlights_on=>Regexp.new("/ro2/[a-z]{2}/item_categories/#{category.id}-")
                    end
                  end
              end
            end

        end

      end
      primary.item :set_items, "Item Sets", item_sets_path, :highlights_on=>/ro2\/[a-z]{2}\/item_sets/
      primary.item :maps, "Maps", maps_path, :highlights_on=>/ro2\/[a-z]{2}\/maps/
      primary.item :dungeons, "Dungeons", dungeons_path, :highlights_on=>/ro2\/[a-z]{2}\/dungeons/
      primary.item :skills, "Skills", skill_groups_path(:learnable=>1), :highlights_on=>/ro2\/[a-z]{2}\/skills/ do |skill_group|
        skill_group.item :skills_learnable, "All skills", skill_groups_path, :highlights_on=>/ro2\/[a-z]{2}\/skills\/?$/
        skill_group.item :placeholder_skills, "", :class => :placeholder
        skill_group.item :skills_learnable, "Learnable skills", skill_groups_path(:learnable=>1)
        skill_group.item :skills_learnable, "Monster skills", skill_groups_path(:learnable=>0)
      end
      #primary.item :exp_overview, "EXP Table", exp_overview_path

    end
  end

  def ragnarok2_icon_image_tag(icon, opts={})
    image_tag("/games/ro2/icons/#{icon}.png", opts)
  end

  def ragnarok2_human_percent(value)
    number_to_percentage(value.to_f/100, :precision=>2)
  end

  def ragnarok2_human_description(text)
    text.to_s.gsub(/^"|"$/, '').gsub('\n', "\n")
  end
end
