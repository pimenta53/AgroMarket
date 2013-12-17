# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#


class Category < ActiveRecord::Base

  has_many :ads##################### talvez seja para sair
  has_many :questions############### talvez seja para sair
  has_many :sub_categories

  validates :name, presence: true


  #verifica se categoria possui ads
  def has_ads?
    self.ads.count == 0
  end

end
