# == Schema Information
#
# Table name: academy_answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  up          :integer
#  down        :integer
#  is_deleted  :integer
#  image_url   :string(255)
#  text        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :votes


  def vote_up
    self.up = self.up + 1
    self.save
  end

  def vote_down
    self.down = self.down + 1
    self.save
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
