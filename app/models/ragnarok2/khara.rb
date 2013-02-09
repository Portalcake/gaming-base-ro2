module Ragnarok2
  class Khara < ActiveRecord::Base
    searchable 

    validates :quest_id,
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

    default_scope includes(:reward_title)
    has_one :reward_title,
            :class_name => "Ragnarok2::KharaTitle",
            :foreign_key => :title_id,
            :primary_key => :reward_title_id


    scope :default_order, order("ragnarok2_kharas.min_base_level ASC, ragnarok2_translations_kharas.title ASC")
    scope :main_quests, where("ragnarok2_kharas.quest_type > 0")


    search_for :name, :as => :string do |b, q|
        b.joins{translation.inner}.where{translation.title =~ "%#{q}%"}
    end
    search_for :min_level, :as => :integer do |b, q|
        b.where{min_base_level.gteq q}
    end
    search_for :max_level, :as => :integer do |b, q|
        b.where{max_base_level.lteq q}
    end

    def to_s
      self.name
    end

    def name
      self.translation.title
    end

    def tasks
        Ragnarok2::Khara.where(:quest_id => self.quest_id)
    end

    def to_param
      "#{self.id}-#{self.name.to_s.parameterize}"
    end
  end
end
