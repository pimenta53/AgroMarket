class Academy::Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes
end
