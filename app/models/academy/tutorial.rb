# == Schema Information
#
# Table name: academy_tutorials
#
#  id                :integer          not null, primary key
#  category_id       :integer          not null
#  user_id           :integer          not null
#  aproved           :boolean          default(FALSE)
#  title             :string(255)
#  text              :text
#  is_deleted        :boolean          default(FALSE)
#  rapid_description :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Academy::Tutorial < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tutorial_images

  def to_param
  		"#{id}-#{title.parameterize}"
  end

  def is_delected

  end
end
