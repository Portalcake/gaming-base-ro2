module Ragnarok2
  class ItemCashInfo < ActiveRecord::Base
    has_one :item,
      :foreign_key => :item_id,
      :primary_key => :item_id
  end
end
