# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class District < ActiveRecord::Base
	has_many :cities
	validates :name, presence: true
end
