module Ragnarok2
  class CitizenItem < ActiveRecord::Base
    attr_accessible :item, :buy_type, :max

    belongs_to :citizen, :inverse_of => :citizen_items
    belongs_to :item, :inverse_of => :citizen_items

    validates :item, :citizen, :presence => true
  end
end
