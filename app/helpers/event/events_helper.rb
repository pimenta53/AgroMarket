module Event::EventsHelper

	def event_image( image )
		 if !image.blank?
             image_tag image, :style => "width: 100%; height: 100%;", :alt => "300x200", :class=>"img-rounded img-responsive"
         else
         	 image_tag "/assets/defaultAdPic.png" ,:style => "width: 100%; height: 100%;", :class=>"img-rounded img-responsive"
         end
	end
end
