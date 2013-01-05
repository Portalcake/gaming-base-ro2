module Ragnarok2
  module ItemsHelper
    def human_item_durability(value)
      number_to_percentage(value.to_f/100, :precision=>2)
    end
  end
end
