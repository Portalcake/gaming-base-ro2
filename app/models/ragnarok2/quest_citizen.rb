module Ragnarok2
  class QuestCitizen < ActiveRecord::Base
    attr_accessible :is_start, :citizen
    belongs_to :quest, :inverse_of => :quest_citizens
    belongs_to :citizen, :inverse_of => :quest_citizens

    validates :quest, :citizen, :presence => true
  end
end
