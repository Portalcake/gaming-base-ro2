module Ragnarok2
  module CitizensHelper
    def human_element_resistance(value)
      number_to_percentage(value.to_f/100, :precision=>2)
    end

    def human_element(value)
      case value
      when 1
        "Water"
      when 2
        "Earth"
      when 3
        "Wind"
      when 4
        "Fire"
      when 5
        "Poisen"
      else
        content_tag(:i, "unknown")
      end
    end
  end
end
