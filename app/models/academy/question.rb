class Academy::Question < ActiveRecord::Base
  has_many :Answers
  belongs_to :user
  belongs_to :category

## validations ##
  validates :title, presence: true
  validates :text, presence: true
## end validations ##

end
