module Ragnarok2
  class QuestItemReward < ActiveRecord::Base
    attr_accessible :amount, :item

    belongs_to :quest, :inverse_of => :quest_item_rewards
    belongs_to :item, :inverse_of => :quest_item_rewards

    validates :quest_id, :presence => true
    validates :item_id, :presence => true

    validates :amount,
        :numericality => {
          :only_integer => true,
          :greater_than => 0
        }
  end
end
