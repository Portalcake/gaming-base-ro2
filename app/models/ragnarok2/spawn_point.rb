module Ragnarok2
  class SpawnPoint < ActiveRecord::Base
    validates :map, :citizen, :pos_x, :pos_y, :pos_z, :presence => true

    belongs_to :map,
        :foreign_key => :map_id,
        :primary_key => :map_id,
        :inverse_of => :spawn_points

    belongs_to :citizen,
        :primary_key => :citizen_id,
        :inverse_of => :spawn_points
  end
end
