module Ragnarok2
  class Job < ActiveRecord::Base
    validates :job_id,
        :uniqueness => { :case_sensitive => false },
        :allow_blank => false,
        :numericality => { :only_integer => true }

    default_scope includes(:name)
    belongs_to :name,
            :foreign_key => :string_job_name,
            :primary_key => :job_id,
            :class_name => "Ragnarok2::Translations::JobName"

    has_many :item_jobs, :dependent => :destroy
    has_many :items, :through=>:item_jobs

    def to_s
      "#{self.name}"
    end
  end
end
