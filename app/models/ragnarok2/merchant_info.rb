module Ragnarok2
  class MerchantInfo < ActiveRecord::Base
    validates :entry_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :merchant_function_id, :item_id, :max, :buy_type,
        :numericality => { :only_integer => true },
        :allow_blank => false
  end
end
