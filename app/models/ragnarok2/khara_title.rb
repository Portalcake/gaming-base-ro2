module Ragnarok2
  class KharaTitle < ActiveRecord::Base
    validates :title_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :title_id,
            :primary_key => :title_id,
            :class_name => "Ragnarok2::Translations::KharaRewardTitle"
    default_scope includes(:khara_attributes)
    belongs_to :khara_attributes,
        :class_name => "Ragnarok2::KharaRewardTitle",
        :foreign_key => :title_id,
        :primary_key => :title_id

    def to_s
      "#{self.name}"
    end
  end
end
