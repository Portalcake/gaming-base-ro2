module Ragnarok2
  class Map < ActiveRecord::Base
    validates :map_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    has_many :quests,
            :primary_key => :map_id,
            :foreign_key => :area_id

    has_many :map_dungeons, :dependent => :destroy
    has_many :dungeons, :through => :map_dungeons

    has_many :map_images,
      :primary_key => :map_id

    scope :default_order, order("ragnarok2_maps.name ASC")
    def to_s
      self.name
    end

    def to_param
      "#{self.id}-#{self.name.parameterize}"
    end
  end
end
