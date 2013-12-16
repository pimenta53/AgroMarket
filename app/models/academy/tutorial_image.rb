# == Schema Information
#
# Table name: academy_tutorial_images
#
#  id          :integer          not null, primary key
#  tutorial_id :integer          not null
#  url         :string(255)
#  is_deleted  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::TutorialImage < ActiveRecord::Base
  belongs_to :tutorial

  has_attached_file :image,:styles => {
	:avatar => "50x50>",
	:thumb => "100x100>",
	:small  => "300x300>",
	:large => "600x600>"
  }
  
end
