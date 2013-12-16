# == Schema Information
#
# Table name: academy_questions
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  category_id :integer          not null
#  title       :string(255)      not null
#  text        :text
#  is_deleted  :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Academy::Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  belongs_to :category

## validations ##
  validates :title, presence: true
  validates :text, presence: true
  validates :category, presence: true

## end validations ##

  def to_param
  	 "#{id}-#{title.parameterize}"
  end

  def self.search(nome,category_id)
	   if nome
      where('(nome LIKE ? or descricao LIKE ?) and activo == 1',"%#{nome}%","%#{nome}%")
     elsif !category_id.nil?
      where('category_id = ? and activo == 1',category_id)
      else
       all
    end
 end

 #resposta com melhor votacao
  def best_answer

    answer = self.answers.order('up - down DESC').first

    return answer
  end

end
