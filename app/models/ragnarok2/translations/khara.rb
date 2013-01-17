module Ragnarok2
  class Translations::Khara < ActiveRecord::Base
    validates :quest_id,
      :uniqueness => { :case_sensitive => false },
      :allow_blank => false,
      :numericality => { :only_integer => true }

    validates :title,
      :presence => true,
      :allow_blank => false
  end
end
