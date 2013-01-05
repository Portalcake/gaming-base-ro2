module Ragnarok2
  class Trait < ActiveRecord::Base
    validates :item_id,
        :allow_blank => false,
        :numericality => { :only_integer => true }

    belongs_to :item,
            :foreign_key => :item_id,
            :primary_key => :item_id,
            :inverse_of => :traits


    def name
      Translations::TraitName.where(:trait_id => "34500000#{self.trait_type.to_s.rjust(2, "0")}").first
    end
  end
end
