module Ragnarok2
  class SetTrait < ActiveRecord::Base
    validates :set_id,
        :allow_blank => false,
        :numericality => { :only_integer => true }

    belongs_to :item_set,
            :foreign_key => :set_id,
            :primary_key => :set_id,
            :inverse_of => :set_traits


    def name
      Translations::TraitName.where(:trait_id => "34500000#{self.trait_type.to_s.rjust(2, "0")}").first
    end
  end
end
