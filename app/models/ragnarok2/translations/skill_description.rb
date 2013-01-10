module Ragnarok2
  class Translations::SkillDescription < ActiveRecord::Base
    validates :skill_id,
      :uniqueness => { :case_sensitive => false },
      :allow_blank => false,
      :numericality => { :only_integer => true }

    validates :translation, :presence => true

    def to_s
      self.translation
    end
  end
end
