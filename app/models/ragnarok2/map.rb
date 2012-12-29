module Ragnarok2
  class Map < ActiveRecord::Base
    validates :map_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    has_many :quests,
            :primary_key => :map_id,
            :foreign_key => :area_id

    def to_s
      self.name
    end

    def to_param
      "#{self.id}-#{self.name.parameterize}"
    end
  end
end
