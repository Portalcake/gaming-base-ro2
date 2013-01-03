module Ragnarok2
  class BaseExp < ActiveRecord::Base
    validates :base_level,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    validates :base_exp_next, :npc_base_exp, :pro_exp_next, 
        :presence=>true, :numericality => { :only_integer => true }
  end
end
