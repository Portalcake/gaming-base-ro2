module Ragnarok2
  class KharaRewardTitle < ActiveRecord::Base
    
    def bonus_attributes=(attributes)
      #reset values
      self.attributes.each do |attribute, value|
        self[attribute] = 0 if attribute.match(/^attribute_\w+$/)
      end
      #insert/overwrite with new ones
      attributes.scan(/(\w+)((?:\+|-)\d+)/).each do |attribute, value|
        self["attribute_#{attribute.downcase}"] = value.to_i
      end
      self.save
    end

    def bonus_attributes
      bonus = []
      self.attributes.each do |attribute, value|
        if attribute.match(/^attribute_(\w+)$/)
          bonus << [$1.to_sym, value] unless value.zero?
        end
      end
      bonus
    end


  end
end
