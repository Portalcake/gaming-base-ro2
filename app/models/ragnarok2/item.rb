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

    default_scope includes(:description)
    belongs_to :description,
            :foreign_key => :string_item_description,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::Translations::ItemDescription"

    belongs_to :category,
            :inverse_of => :items,
            :foreign_key => :category_id,
            :class_name => "Ragnarok2::ItemCategory",
            :counter_cache => true

    belongs_to :cash_shop_info,
            :inverse_of => :item,
            :foreign_key => :item_id,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::ItemCashInfo"

    has_many :quest_item_rewards, :dependent => :destroy
    has_many :quests, :through => :quest_item_rewards

    has_many :citizen_items, :dependent => :destroy
    has_many :sellcitizens,
            :through => :citizen_items,
            :class_name => "Ragnarok2::Citizen",
            :source => :citizen

    has_many :main_set_items,
            :foreign_key => :item_1_id,
            :class_name => "Ragnarok2::SetItem",
            :dependent => :destroy

    has_many :alternative_set_items,
            :foreign_key => :item_2_id,
            :class_name => "Ragnarok2::SetItem",
            :dependent => :nullify

    has_many :main_sets,
            :through => :main_set_items,
            :source => :item_set
    has_many :alternative_sets,
            :through => :alternative_set_items,
            :source => :item_set

    has_many :traits,
            :foreign_key => :item_id,
            :primary_key => :item_id

    has_many :item_break_results,
            :primary_key => :item_break_result_id,
            :foreign_key => :result_id,
            :order => 'grade ASC'

    default_scope includes(:skill)
    belongs_to :skill,
            :primary_key => :skill_id,
            :foreign_key => :skill_id_1

    has_many :item_jobs, :dependent => :destroy
    default_scope includes(:jobs)
    has_many :jobs, :through=>:item_jobs

    has_many :citizen_drops,
            :dependent => :destroy
    has_many :dropcitizens,
            :through => :citizen_drops,
            :class_name => "Ragnarok2::Citizen",
            :source => :citizen

    has_many :craft_infos,
            :foreign_key => :craft_item_id,
            :primary_key => :item_id

    has_many :craft_materials,
            :through => :craft_infos

    has_many :craft_ingredients,
            :class_name => "Ragnarok2::CraftMaterial",
            :foreign_key => :material_id

    has_many :random_sets,
            :primary_key => :randomset_id,
            :foreign_key => :random_set_id,
            :dependent => :destroy

    has_many :random_set_items,
            :through => :random_sets,
            :source => :item

    has_many :found_in_boxes,
            :foreign_key => :item_id,
            :primary_key => :item_id,
            :class_name => "Ragnarok2::RandomSet"


    has_many :craft_scrolls,
            :primary_key => :item_id,
            :foreign_key => :item_id,
            :dependent => :destroy

    has_many :craft_info_scrolls,
            :through => :craft_scrolls,
            :source => :craft_info

    has_one :item_socket_group,
            :foreign_key => :socket_group_id,
            :primary_key => :socket_groupid

    alias_method :drops, :citizen_drops

    before_save :update_icon_name, :update_required_joblist

    scope :default_order, order("ragnarok2_items.require_level ASC, ragnarok2_translations_item_names.translation ASC")

    scope :search_by_name, lambda {|name|
        where("ragnarok2_translations_item_names.translation LIKE ?", "%#{name}%")
    }

    def citizens
        self.sellcitizens+self.dropcitizens
    end

    def to_s
      "#{self.name}"
    end

    def to_param
      "#{self.id}-#{self.name.to_s.parameterize}"
    end

    def categories
        high_category, medium_category, low_category = nil
        high_category = ItemCategory.where(:high_category=>self.high_category_id, :medium_category=>0, :low_category=>0).first
        
        unless self.medium_category_id.zero?
        medium_category = ItemCategory.where(:high_category=>self.high_category_id, :medium_category=>self.medium_category_id, :low_category=>0).first
        end
        
        unless self.low_category_id.zero?
        low_category = ItemCategory.where(:high_category=>self.high_category_id, :medium_category=>self.medium_category_id, :low_category=>self.low_category_id).first
        end

        [high_category, medium_category, low_category].compact
    end

    def sockets
        item_socket_group && item_socket_group.sockets || []
    end

    private 

    def update_icon_name
        return unless self.icon_changed?
        name = self.icon.scan(/[^\\\/]+\.dds/).first
        name = name.gsub(".dds", "").downcase if name
        self.icon = name
    end

    def update_required_joblist(force=false)
        return unless self.require_job_changed? || force

        jobs = []
        self.require_job.to_s(2).reverse.split("").each_with_index do |enabled, job_id|
          jobs << job_id+1 unless enabled.to_i.zero?
        end
        self.jobs = Ragnarok2::Job.where(:job_id=>jobs)
    end
  end
end
