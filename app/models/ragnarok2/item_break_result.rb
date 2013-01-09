module Ragnarok2
  class ItemBreakResult < ActiveRecord::Base


    def results
      [
        {
          :item=>Ragnarok2::Item.where(:item_id=>self.result_item_1_id).first,
          :amount => self.result_item_1_amount,
          :rate => self.result_item_1_rate
        },
        {
          :item=>Ragnarok2::Item.where(:item_id=>self.result_item_2_id).first,
          :amount => self.result_item_2_amount,
          :rate => self.result_item_2_rate
        }
      ].delete_if {|r| r[:item].nil?}
    end

    def helper_item
      Ragnarok2::Item.where(:item_id=>self.needed_item_id).first
    end

  end
end
