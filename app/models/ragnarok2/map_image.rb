module Ragnarok2
  class MapImage < ActiveRecord::Base
    has_attached_file :image, 
      :styles => {
        :medium => ["400x300>", :png], :thumb => ["200x150>", :png]
      },
      :url => "/games/ro2/:class/:attachment/:id_partition/:hash.:extension",
      :hash_secret => "eh2k4h33h4u2jbv3jb5b66m7b788n3bb0bvvh2gk1j3v5nn2jh23jk23n5h2"
      

    validates_attachment_presence :image

    belongs_to :map,
      :inverse_of => :map_images,
      :primary_key => :map_id
      
  end
end
