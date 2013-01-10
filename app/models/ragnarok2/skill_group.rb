module Ragnarok2
  class SkillGroup < ActiveRecord::Base

    default_scope includes(:skills)
    has_many :skills,
            :primary_key => :skill_group,
            :order => "skill_level ASC",
            :dependent => :destroy

    before_save :update_skill_icon

    scope :default_order, order("ragnarok2_skill_groups.name_fallback ASC")


    scope :search, lambda {|params|
      if params[:learnable]
        where("ragnarok2_skill_groups.check_learn_skill = ?",  params[:learnable])
      end
    }

    def to_s
      self.name_fallback
    end

    def to_param
      "#{self.id}-#{self.name_fallback.parameterize}"
    end

    def required_skills
      Ragnarok2::Skill.where(:skill_id=>[self.need_before_skill_id_1, self.need_before_skill_id_2, self.need_before_skill_id_3])
    end


    private
    def update_skill_icon
        return unless self.skill_icon_changed?
        name = self.skill_icon.scan(/[^\\\/]+\.dds/).first
        name = name.gsub(".dds", "").downcase if name
        self.skill_icon = name
    end
  end
end
