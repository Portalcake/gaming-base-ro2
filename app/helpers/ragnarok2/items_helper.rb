module Ragnarok2
  module ItemsHelper
    def human_item_durability(value)
      return "-" if value.zero?
      number_to_percentage(value.to_f/100, :precision=>2)
    end

    def human_gender(value)
      case value
      when 3
        "unisex"
      when 2
        "female"
      when 1
        "male"
      else
        content_tag(:i, "unknown")
      end
    end
  end
end
