module Ragnarok2
  class SetItem < ActiveRecord::Base
    belongs_to :item_set, :inverse_of => :set_item

    validates :main_item,
        :presence => true,
        :allow_blank => false

    validates :alternative_item,
        :presence => true,
        :allow_blank => true

    belongs_to :main_item,
        :foreign_key => :item_1_id,
        :class_name => "Ragnarok2::Item",
        :inverse_of => :main_set_items

    belongs_to :alternative_item,
        :foreign_key => :item_2_id,
        :class_name => "Ragnarok2::Item",
        :inverse_of => :alternative_set_items

  end
end
