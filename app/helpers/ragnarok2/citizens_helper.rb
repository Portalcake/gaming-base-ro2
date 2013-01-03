module Ragnarok2
  module CitizensHelper
    def human_element_resistance(value)
      number_to_percentage(value.to_f/100, :precision=>2)
    end
  end
end
