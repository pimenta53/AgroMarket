# == Schema Information
#
# Table name: admin_publicities
#
#  id                 :integer          not null, primary key
#  title              :string(255)
#  description        :string(255)
#  expire_date        :datetime
#  owner              :string(255)
#  is_deleted         :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Admin::Publicity < ActiveRecord::Base
	has_attached_file :image,:styles => {
		:avatar => "50x50!",
		:thumb => "100x100!",
		:small  => "300x300!",
		:ad_size => "1200x800!",
		:large => "600x600!"
	}

end
