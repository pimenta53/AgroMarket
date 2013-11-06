# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
	has_many :city
	validates :name, presence: true
end
