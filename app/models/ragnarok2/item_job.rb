module Ragnarok2
  class ItemJob < ActiveRecord::Base
    belongs_to :item, :inverse_of => :item_jobs
    belongs_to :job, :inverse_of => :item_jobs
  end
end
