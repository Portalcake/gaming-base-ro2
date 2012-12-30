module Ragnarok2
  class Item < ActiveRecord::Base
    validates :item_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :name, :presence => true

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :string_item_name,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::Translations::ItemName"

    #default_scope includes(:description)
    belongs_to :description,
            :foreign_key => :string_item_description,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::Translations::ItemDescription"

    belongs_to :category,
            :foreign_key => :category_id,
            :class_name => "Ragnarok2::ItemCategory",
            :counter_cache => true

    has_many :quest_item_rewards, :dependent => :destroy
    has_many :quests, :through => :quest_item_rewards

    has_many :citizen_items, :dependent => :destroy
    has_many :citizens, :through => :citizen_items

    has_many :main_set_items,
            :foreign_key => :item_1_id,
            :class_name => "Ragnarok2::SetItem",
            :dependent => :destroy

    has_many :alternative_set_items,
            :foreign_key => :item_2_id,
            :class_name => "Ragnarok2::SetItem",
            :dependent => :nullify

    has_many :main_sets, :through => :main_set_items, :source => :item_set
    has_many :alternative_sets, :through => :alternative_set_items, :source => :item_set


    before_validation :update_category

    def to_s
      "#{self.name}"
    end

    def to_param
      "#{self.id}-#{self.name.to_s.parameterize}"
    end

    private 
    def update_category
        self.category = ItemCategory.where(
            :high_category => self.high_category,
            :medium_category => self.medium_category,
            :low_category => self.low_category,
        ).first
    end
  end
end
