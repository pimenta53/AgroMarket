# == Schema Information
#
# Table name: academy_answers
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  user_id     :integer          not null
#  up          :integer          default(0)
#  down        :integer          default(0)
#  is_deleted  :boolean          default(FALSE)
#  text        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes

  

  #verifica se ultizador já votou
  def has_vote?(user)
    self.votes.where(:user_id => user.id ).first
  end

  def which_vote?(user)
    result = 0
    v = has_vote?(user)
    if v != nil
      result = v.vote
    end

    return result
  end

  def vote_up
    self.up = self.up + 1
    self.save
  end

  def vote_down
    self.down = self.down + 1
    self.save
  end

  #devolve o ratio da pergunta
  def total_votes
    self.up - self.down
  end


  def vote_up_from_down
    self.down = self.down - 1
    self.up = self.up + 1
    self.save
  end

  def vote_down_from_up
    self.down = self.down + 1
    self.up = self.up - 1
    self.save
  end

  



end
