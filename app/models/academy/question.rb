class Academy::Question < ActiveRecord::Base
  has_many :Answers
  belongs_to :User
  belongs_to :Category
end
