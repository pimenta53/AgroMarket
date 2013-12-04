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
