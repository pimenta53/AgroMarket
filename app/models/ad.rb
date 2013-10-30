# == Schema Information
#
# Table name: ads
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :string(255)
#  price         :float
#  expire_date   :datetime
#  location      :string(255)
#  is_active     :binary
#  type_price_id :integer
#  city_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Ad < ActiveRecord::Base
	belongs_to :city
	has_many :ad_images, :dependent => :destroy
	accepts_nested_attributes_for :ad_images
end
