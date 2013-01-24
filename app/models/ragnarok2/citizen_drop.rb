module Ragnarok2
  class CitizenDrop < ActiveRecord::Base

    belongs_to :item, :inverse_of => :citizen_drops
    belongs_to :citizen, :inverse_of => :citizen_drops

    validates :item, :citizen, :presence => true

    default_scope includes(:citizen_drop_users)
    has_many :citizen_drop_users,
          :dependent => :destroy
    has_many :users,
          :through => :citizen_drop_users

    alias_method :votes, :citizen_drop_users

    scope :default_order, order("approving_users_count DESC, disapproving_users_count ASC")

    def update_user_counter_cache!
      self.update_attributes(
        {:approving_users_count => self.votes.select{|v| v.approved?; v.approved?}.count,
        :disapproving_users_count => self.votes.select{|v| !v.approved?}.count},
        :without_protection=>true
      )
      self.destroy if self.approving_users_count.zero?
    end
  end
end
