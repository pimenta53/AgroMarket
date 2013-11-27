class Academy::Answer < ActiveRecord::Base
  belongs_to :Question
  has_many :Votes
end
