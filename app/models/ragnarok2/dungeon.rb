module Ragnarok2
  class Dungeon < ActiveRecord::Base
    validates :dungeon_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    has_many :map_dungeons, :dependent => :destroy
    has_many :maps, :through => :map_dungeons
    has_many :dungeon_quests,
        :dependent => :destroy
    belongs_to :quest

    scope :default_order, order("ragnarok2_dungeons.name ASC, ragnarok2_dungeons.map_level ASC")

    after_save :update_maps

    def to_s
      self.name
    end

    def to_param
      "#{self.id}-#{self.name.parameterize}"
    end

    def quest_id=(quest_id)
      quest_id = nil if quest_id.to_i.zero?
      super
    end

    private
    def update_maps
      return unless maps_changed?

      self.map_dungeons.destroy_all
      self.maps = Map.where(:map_id=>[self.map_index1, self.map_index2, self.map_index3])
    end

    def maps_changed?
      self.map_index1_changed? || self.map_index2_changed? || self.map_index3_changed?
    end
  end
end
