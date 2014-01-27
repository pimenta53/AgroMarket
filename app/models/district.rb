# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class District < ActiveRecord::Base
	has_many :cities
	has_many :users, through: :cities
	has_many :ads, through: :cities 
	validates :name, presence: true
end
