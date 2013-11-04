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
#  category_id
class Ad < ActiveRecord::Base
	# associations
	belongs_to :city
	belongs_to :user
	belongs_to :category

	has_many :ad_images, :dependent => :destroy
	has_many :messages
	#scopes

	# atributes
	accepts_nested_attributes_for :ad_images

	#filters
	before_validation :create_permalink

	
	#validates
  	validates :title, presence: true
  	validates :price, presence: true
  	validates :expire_date, presence: true
  	validates :type_price_id, presence: true
  	validates :city_id, presence: true

  	validate :expire_date_cannot_be_in_the_past, :on => :create

  	# class methods
  	def search

  	end

  	# instance methods
	def to_param
		"#{id}-#{permanent_link}"
	end
	
	# private methods
	private
		#para criar friendly Url
		def create_permalink
		  self.permanent_link = "#{self.title.parameterize}"
		end

		def expire_date_cannot_be_in_the_past
    	errors.add(:expire_date, "can't be in the past") if
      		!expire_date.blank? and expire_date < Date.today
  		end


end
