module Ragnarok2
  class Translations::Quest < ActiveRecord::Base
    validates :quest_id,
      :uniqueness => { :case_sensitive => false },
      :allow_blank => false,
      :numericality => { :only_integer => true }

    validates :quest_title, :presence => true
  end
end
