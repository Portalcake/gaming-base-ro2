module Ragnarok2
  module QuestsHelper
    def human_quest_type(type=0)
      case type
      when 1
        "Meet NPC"
      when 2
        "Collect items"
      when 3
        "Go to position"
      else
        content_tag(:i, "unknown")
      end
    end
  end
end
