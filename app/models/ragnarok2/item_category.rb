module Ragnarok2
  class ItemCategory < ActiveRecord::Base
    validates :category_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :name, :presence => true

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :string_category_name,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::Translations::ItemCategory"

    has_many :items,
            :foreign_key => :category_id

    #always hide empty categories
    default_scope where("ragnarok2_item_categories.items_count > 0 ")

    def to_s
      "#{self.name}"
    end

    def to_param
      "#{self.id}-#{self.to_s.parameterize}"
    end
  end
end
