module Ragnarok2
  class KharaTitle < ActiveRecord::Base
    validates :title_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }
  end
end
