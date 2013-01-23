module Ragnarok2
  class CitizenDropUser < ActiveRecord::Base
    belongs_to :user
    belongs_to :citizen_drop, :inverse_of => :citizen_drop_users

    after_save :update_counter_cache
    after_destroy :update_counter_cache

    private
    def update_counter_cache
      self.citizen_drop.update_user_counter_cache! 
    end
  end
end
