module Ragnarok2
  class QuestInfo < ActiveRecord::Base
    validates :quest_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    belongs_to :quest,
            :primary_key => :quest_id,
            :foreign_key => :quest_id


    def tasks
      tasks = []
      1.upto(10) do |i|
        next if self["complete_target_#{i}"].zero?
        tasks << {
          :type=>self["complete_target_#{i}"],
          :target => Citizen.where(:citizen_id=>self["target_id_#{i}"]).first,
          :map => Map.where(:map_id=>self["area_id_#{i}"]).first
        }
      end
      tasks
    end
  end
end
