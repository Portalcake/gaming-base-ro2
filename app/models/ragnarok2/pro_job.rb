module Ragnarok2
  class ProJob < ActiveRecord::Base
    def to_s
      self.string_protype
    end

    default_scope includes(:translation)
    belongs_to :translation,
            :primary_key => :job_id,
            :foreign_key => :string_protype,
            :class_name => "Ragnarok2::Translations::JobName"

    def to_s
      "#{self.translation}"
    end
  end
end
