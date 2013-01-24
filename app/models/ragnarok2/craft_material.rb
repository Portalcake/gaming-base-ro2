module Ragnarok2
  class CraftMaterial < ActiveRecord::Base
    belongs_to :craft_info,
          :primary_key => :craft_info_id,
          :inverse_of => :craft_materials
    belongs_to :item,
          :inverse_of => :craft_materials
    belongs_to :material,
          :class_name => "Ragnarok2::Item",
          :inverse_of => :craft_ingredients

    validates :item, :material, :craft_info, :presence=>true
    validates :amount, :numericality => { :only_integer => true, :greather_than => 0 }
  end
end
