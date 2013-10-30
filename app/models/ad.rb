class Ad < ActiveRecord::Base
	has_many :ad_images, :dependent => :destroy
	accepts_nested_attributes_for :ad_images
end
