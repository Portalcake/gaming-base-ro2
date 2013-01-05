module Ragnarok2
  class Quest < ActiveRecord::Base
    @@rewards_columns = [
        [:reward_item_id1, :reward_item_count1],
        [:reward_item_id2, :reward_item_count2],
        [:reward_item_id3, :reward_item_count3],
        [:reward_item_id4, :reward_item_count4],
        [:reward_item_id5, :reward_item_count5]
    ]

    validates :quest_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :max_base_level,
        :allow_blank => false,
        :numericality => {
            :only_integer => true,
            :greater_than => 0
        }

    validates :translation, :presence => true

    after_save :update_rewards, :update_citizens

    default_scope includes(:translation)
    default_scope includes(:quest_citizens, :citizens)
    default_scope :order => "min_base_level ASC, recommand_base_level ASC"

    belongs_to :translation,
            :primary_key => :quest_id,
            :foreign_key => :quest_id,
            :class_name => "Ragnarok2::Translations::Quest"

    belongs_to :previous_quest,
            :primary_key => :quest_id,
            :foreign_key => :need_quest_id,
            :class_name => "Ragnarok2::Quest"
    
    belongs_to :next_quest,
            :primary_key => :quest_id,
            :foreign_key => :next_quest_id,
            :class_name => "Ragnarok2::Quest"

    belongs_to :map,
            :primary_key => :map_id,
            :foreign_key => :area_id,
            :inverse_of => :quests

    belongs_to :pro_job,
            :foreign_key => :pc_projob,
            :primary_key => :pro_job_id

    has_one :quest_info,
            :primary_key => :quest_id,
            :foreign_key => :quest_id

    has_many :quest_citizens, :dependent => :destroy
    has_many :citizens, :through => :quest_citizens

    has_many :start_citizens,
            :through => :quest_citizens,
            :class_name => "Ragnarok2::Citizen",
            :source => :citizen,
            :conditions => ["ragnarok2_quest_citizens.is_start = ?", true]
    has_many :end_citizens,
            :through => :quest_citizens,
            :class_name => "Ragnarok2::Citizen",
            :source => :citizen,
            :conditions => ["ragnarok2_quest_citizens.is_start = ?", false]

    has_many :quest_item_rewards, :dependent => :destroy
    has_many :items, :through => :quest_item_rewards
    has_many :dungeons,
            :primary_key => :quest_id

    def quest_title
      self.translation.quest_title
    end

    def to_s
      self.quest_title
    end

    def to_param
      "#{self.id}-#{self.quest_title.parameterize}"
    end

    alias_method :rewards, :quest_item_rewards

    private 

    def update_citizens
        if self.start_type_id_changed?
            self.quest_citizens.where(:is_start=>true).destroy_all
            start_cititzen = Citizen.where(:citizen_id=>self.start_type_id).first
            self.quest_citizens.create(:citizen=>start_cititzen, :is_start=>true) if start_cititzen
        end
        if self.reward_npc_id_changed?
            self.quest_citizens.where(:is_start=>false).destroy_all
            end_cititzen = Citizen.where(:citizen_id=>self.reward_npc_id).first
            self.quest_citizens.create(:citizen=>end_cititzen, :is_start=>false) if start_cititzen
        end
    end

    def update_rewards(force=false)
      #only rebuild if any rewards have been changed
      return unless columns_changed?(@@rewards_columns) || force
      self.rewards.destroy_all
      @@rewards_columns.each do |column_item_id, column_amount_id|
        next unless self[column_item_id] && !self[column_item_id].zero?
        item = Item.where(:item_id=>self[column_item_id]).first
        self.rewards.create(:item => item, :amount => self[column_amount_id]) if self[column_amount_id]
      end
    end

    def columns_changed?(columns_to_check)
      columns_to_check.each do |a|
        begin
        return true if self.send("#{a.first}_changed?") || self.send("#{a.last}_changed?")
        rescue NoMethodError
          #attribute is unknown, so we can ignore it
        end
      end
      false
    end
  end
end
