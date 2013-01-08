module Ragnarok2
  module ItemsHelper
    def human_item_durability(value)
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
        "-"
      end
    end
  end
end
