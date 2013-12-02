class Academy::Question < ActiveRecord::Base
  has_many :Answers
  belongs_to :user
  belongs_to :category
end
