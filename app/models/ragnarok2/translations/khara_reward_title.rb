module Ragnarok2
  class Translations::KharaRewardTitle < ActiveRecord::Base
    def to_s
      self.title
    end
  end
end
