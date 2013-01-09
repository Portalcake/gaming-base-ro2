module Ragnarok2
  class ItemSet < ActiveRecord::Base

    validates :string_id,
        :allow_blank => false,
        :numericality => { :only_integer => true, :greater_than => 0 }

    validates :name, :presence => true

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :string_id,
            :primary_key => :item_set_id,
            :class_name => "Ragnarok2::Translations::ItemSet"

    has_many :set_items, :dependent => :destroy

    has_many :set_traits,
            :foreign_key => :set_id,
            :primary_key => :set_id

    scope :default_order, order("ragnarok2_translations_item_sets.translation ASC")

    alias_method :traits, :set_traits

    def to_s
      "#{self.name}"
    end

    def to_param
      "#{self.id}-#{self.name.to_s.parameterize}"
    end
  end
end
