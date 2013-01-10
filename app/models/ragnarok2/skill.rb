module Ragnarok2
  class Skill < ActiveRecord::Base
    validates :name, :presence => true

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :string_skill_name,
            :primary_key => :skill_id,
            :class_name => "Ragnarok2::Translations::SkillName"

    belongs_to :description,
            :foreign_key => :string_skill_description,
            :primary_key => :skill_id,
            :class_name => "Ragnarok2::Translations::SkillDescription"

    belongs_to :skill_group,
            :primary_key => :skill_group,
            :inverse_of => :skills

    def to_s
      "#{self.name}"
    end
  end
end
