module Ragnarok2
  class Translations::CitizenJobName < ActiveRecord::Base
    validates :citizen_id,
      :uniqueness => { :case_sensitive => false },
      :allow_blank => false,
      :numericality => { :only_integer => true }
      
    validates :translation,
      :presence => true,
      :allow_blank => false

    def to_s
      self.translation
    end
  end
end
