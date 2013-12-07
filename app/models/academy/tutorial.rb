# == Schema Information
#
# Table name: academy_tutorials
#
#  id          :integer          not null, primary key
#  category_id :integer
#  user_id     :integer
#  aproved     :integer
#  title       :string(255)
#  text        :text
#  is_delected :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::Tutorial < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tutorial_images

  def to_param
  		"#{id}-#{title.parameterize}"
  end
end
