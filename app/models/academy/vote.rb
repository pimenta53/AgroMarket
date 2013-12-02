class Academy::Vote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user


  def self.update_votes(user, answer, vote)
    self.where(:user_id => user, :answer_id => answer).first.update(:vote => vote)
  end


end
