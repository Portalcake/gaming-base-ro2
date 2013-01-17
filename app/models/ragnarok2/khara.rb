module Ragnarok2
  class Khara < ActiveRecord::Base
    validates :quest_id,
        :allow_blank => false,
        :numericality => { :only_integer => true, :greater_than=>0 }
    validates :quest_type,
        :allow_blank => false,
        :numericality => { :only_integer => true, :greater_than=>0 }

    validates :translation, :presence=>true

    default_scope includes(:translation)
    belongs_to :translation,
            :foreign_key => :quest_id,
            :primary_key => :quest_id,
            :class_name => "Ragnarok2::Translations::Khara"

    belongs_to :citizen,
            :foreign_key => :reward_npc_id,
            :primary_key => :citizen_id


    scope :default_order, order("ragnarok2_kharas.min_base_level ASC, ragnarok2_translations_kharas.title ASC")


    def to_s
      self.name
    end

    def name
      self.translation.title
    end

    def to_param
      "#{self.id}-#{self.name.to_s.parameterize}"
    end
  end
end
