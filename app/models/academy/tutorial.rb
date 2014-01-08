#encoding: utf-8
# == Schema Information
#
# Table name: academy_tutorials
#
#  id                :integer          not null, primary key
#  category_id       :integer          not null
#  user_id           :integer          not null
#  aproved           :boolean          default(FALSE)
#  title             :string(255)
#  text              :text
#  is_deleted        :boolean          default(FALSE)
#  rapid_description :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#
class Academy::Tutorial < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tutorial_images

  #validates
  validates :text, presence:{ message: "O campo com o conteúdo do tutorial nao pode ser vazio! Explicíte cada passo do tutorial neste campo." }

  def to_param
  		"#{id}-#{title.parameterize}"
  end


  def self.aproved_tutorials
  	where('aproved = ?',true)
  end

  def self.unaproved_tutorials
  	where('aproved= ?',false)
  end

### STATISTIC ZONE #####
def self.today_tutorials_count
  where('created_at > ?', Date.today).count
end

end
