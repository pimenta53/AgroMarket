# == Schema Information
#
# Table name: ad_images
#
#  id                 :integer          not null, primary key
#  ad_id              :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#

class AdImage < ActiveRecord::Base
	belongs_to :ad

	has_attached_file :image,:styles => {:thumb=> "100x100#",:small  => "300x300>",:large => "600x600>"}
	
end
