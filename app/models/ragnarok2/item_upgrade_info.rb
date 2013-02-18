module Ragnarok2
  class ItemUpgradeInfo < ActiveRecord::Base

    belongs_to :item,
      :primary_key => :item_id,
      :inverse_of => :item_upgrade_info

    has_many :upgrade_infos,
      :primary_key => :upgrade_info_id,
      :foreign_key => :result_id
  end
end
