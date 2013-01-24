module Ragnarok2
  class CraftInfo < ActiveRecord::Base
    default_scope includes(:craft_materials)
    has_many :craft_materials,
          :primary_key => :craft_info_id,
          :foreign_key => :craft_info_id,
          :dependent => :destroy

    belongs_to :item,
          :foreign_key => :craft_item_id,
          :primary_key => :item_id,
          :inverse_of => :craft_infos

    alias_method :materials, :craft_materials
  end
end
