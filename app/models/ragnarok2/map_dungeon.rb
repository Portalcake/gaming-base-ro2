module Ragnarok2
  class MapDungeon < ActiveRecord::Base
    belongs_to :map, :inverse_of => :map_dungeons
    belongs_to :dungeon, :inverse_of => :map_dungeons
    
    validates :map_id, :dungeon_id, :presence => true
    validates :map_id, :uniqueness => { :scope => :dungeon_id }
  end
end
