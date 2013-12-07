# == Schema Information
#
# Table name: academy_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category_id :integer
#  title       :string(255)
#  text        :string(255)
#  is_deleted  :integer
#  image_url   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  belongs_to :category

## validations ##
  validates :title, presence: true
  validates :text, presence: true
## end validations ##
	
  def to_param
  	 "#{id}-#{title.parameterize}"
  end

end
