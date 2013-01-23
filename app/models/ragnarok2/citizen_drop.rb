module Ragnarok2
  class CitizenDrop < ActiveRecord::Base

    belongs_to :item, :inverse_of => :citizen_drops
    belongs_to :citizen, :inverse_of => :citizen_drops
    has_many :citizen_drop_users,
          :dependent => :destroy
    has_many :users,
          :through => :citizen_drop_users

    alias_method :votes, :citizen_drop_users

    def update_user_counter_cache!
      puts "---------"
      self.votes.each do |v|
        p v
      end
      puts "---------"
      self.update_attributes(
        {:approving_users_count => self.votes.select{|v| v.approved?; v.approved?}.count,
        :disapproving_users_count => self.votes.select{|v| !v.approved?}.count},
        :without_protection=>true
      )
      self.destroy if self.approving_users_count.zero?
    end
  end
end
