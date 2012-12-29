module Ragnarok2
  class Translations::CitizenDescription < ActiveRecord::Base
    validates :citizen_id,
      :uniqueness => { :case_sensitive => false },
      :allow_blank => false,
      :numericality => { :only_integer => true }

    validates :translation,
      :presence => true,
      :allow_blank => false
  end
end
