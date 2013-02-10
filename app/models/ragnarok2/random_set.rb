module Ragnarok2
  class RandomSet < ActiveRecord::Base
    default_scope includes(:hidden_item)
    belongs_to :hidden_item,
          :primary_key => :item_id,
          :foreign_key => :item_id,
          :class_name => "Ragnarok2::Item"

    has_many :boxes,
          :primary_key => :random_set_id,
          :foreign_key => :randomset_id,
          :class_name => "Ragnarok2::Item"

    validates :hidden_item, :presence => true
  end
end
