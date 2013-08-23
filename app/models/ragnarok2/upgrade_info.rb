module Ragnarok2
  class UpgradeInfo < ActiveRecord::Base
    validates :result_id,
        :allow_blank => false,
        :numericality => { :only_integer => true }

    has_many :items,
        :through => :item_upgrade_info

    belongs_to :item_upgrade_info,
        :primary_key => :upgrade_info_id,
        :foreign_key => :result_id,
        :inverse_of => :upgrade_infos

    belongs_to :normal_material,
        :primary_key => :item_id,
        :foreign_key => :need_normal_material_id,
        :class_name => "Ragnarok2::Item"

    scope :default_scope, order("upgrade_level ASC")
  end
end
