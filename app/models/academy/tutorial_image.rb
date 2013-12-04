# == Schema Information
#
# Table name: academy_tutorial_images
#
#  id          :integer          not null, primary key
#  tutorial_id :integer
#  url         :string(255)
#  is_deleted  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::TutorialImage < ActiveRecord::Base
  belongs_to :tutorial
end
