module Ragnarok2
  class CraftScroll < ActiveRecord::Base
    validates :item_id,
        :allow_blank => false,
        :numericality => { :only_integer => true }
    validates :craft_info_id,
        :allow_blank => false,
        :numericality => { :only_integer => true }

    belongs_to :item,
        :inverse_of => :craft_scrolls,
        :primary_key => :item_id,
        :foreign_key => :item_id

    belongs_to :craft_info,
        :primary_key => :craft_info_id,
        :inverse_of => :craft_scroll_item
  end
end
