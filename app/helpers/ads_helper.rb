module AdsHelper

	def first_image( image )
		 if !image.blank?
             image_tag image.image(:small) ,:style => "width: 66q%; height: 40%;", :alt => "200x100"
         else
         	 image_tag "http://placehold.it/200x100" ,:style => "width: 66%; height: 40%;", :alt => "200x100"
         end
	end


	def ad_image( image )
		 if !image.blank?
             image_tag image.image(:ad_size) , :style => "width: 100%; height: 100%;", :alt => "300x200"
         else
         	 image_tag "http://placehold.it/300x200" ,:style => "width: 100%; height: 100%;", :alt => "200x150"
         end
	end

        def ad_image_admin( image )
         if !image.blank?
             image_tag image.image(:avatar) , :style => "width: 100%; height: 100%;", :alt => "50x50"
         else
             image_tag "http://placehold.it/50x50" ,:style => "width: 100%; height: 100%;", :alt => "50x50"
         end
    end


end
