module Ragnarok2
  class DungeonQuest < ActiveRecord::Base
    validates :quest_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :mission_name, :presence => true

    belongs_to :dungeon, :inverse_of => :dungeon_quests

    def to_s
      self.mission_name
    end
  end
end
