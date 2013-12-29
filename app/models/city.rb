# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  city        :string(255)
#  district_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class City < ActiveRecord::Base
	belongs_to :district

	scope :alphabetically, order("city ASC")

    has_many :users
    has_many :ads

	validates :city, presence: true, uniqueness: true
end
