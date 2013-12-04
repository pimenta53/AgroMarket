class Academy::Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

 ## validations ##
  validates :user_id, presence: true
  validates :answer_id, presence: true
  validates :vote, presence: true
## end validations ##

  def self.update_votes(user, answer, vote)
    self.where(:user_id => user, :answer_id => answer).first.update(:vote => vote)
  end


end
