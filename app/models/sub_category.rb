# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#


class SubCategory < ActiveRecord::Base

  has_many :ads
  has_many :questions
  belongs_to :category

  validates :name, presence: true


  #verifica se categoria possui ads
  def has_ads?
    self.ads.count == 0
  end
  
end
