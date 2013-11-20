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
	belongs_to :price_type, :foreign_key  => 'type_price_id'

	has_many :ad_images, :dependent => :destroy
	has_many :messages
	has_many :talks

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
	validate :expire_date_cannot_exceed_limit

  	# class methods

  	def self.separateQuery(params)
  		categories = Array.new
  		cities = Array.new
  		$i = 0
  		begin 
  			if params[$i][1] == "a"
  				categories.push(Integer(params[$i].gsub(/[^[:digit:]]/, '')))
  			else 
  				if params[$i][1] == "i"
  					cities.push(Integer(params[$i].gsub(/[^[:digit:]]/, '')))
  				end
  			end
  			$i +=1
  		end while $i < params.length
  		result = [categories,cities]
  	end

  	def self.search(params)
  		if params
  			result = self.separateQuery(params) #separa as categorias e as cidades
  			categories = result[0]
  			cities = result[1]


  			if categories.length>0 && cities.length>0 #caso se filtre por categoria e cidade (interseccao)
  				filtered_categories = where(category_id: categories)
  				filtered_categories.where(city_id: cities)

  			else 
  				if categories.length>0 #caso so se filtre por categorias
  					where(category_id: categories)
  				else 
  					if cities.length>0 #caso so se filtre por cidade
  						where(city_id: cities)
  					else
  						all
  					end
  				end
  			end
  		else
  			all
  		end
  	end

  	

  	# instance methods
  	def to_param
  		"#{id}-#{permanent_link}"
  	end

  	def increment_page_view
  		self.page_views = self.page_views + 1
  		self.save
  	end

  	def limited_description(limit)
  		if (self.description.length > limit)
  			if limit < 4 || self.description.length < 3
  				"..."
  			else
  				self.description.first(limit-3) + "..."
  			end
  		else
  			self.description
  		end
  	end

	#######################
    ### STATISTIC ZONE ####
    #######################

    def self.ads_per_city
    	result = Array.new
    	City.find(:all, :includes => ads ).each do |c|
    		results.push([ c.name , c.ads.count ])
    	end
    	return result
    end

    def self.most_viewed_this_week
    	where("created_at > ?", 1.week.ago).order('page_views').limit(10)
    end

    def self.most_viewed( n )
    	order(:page_views).limit( n )
    end

    def self.ads_per_category
    	result = Array.new
    	Category.find(:all, :includes => ads ).each do |c|
    		results.push([ c.name , c.ads.count ])
    	end
    	return result
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

		def expire_date_cannot_exceed_limit
			errors.add(:expire_date, "can't exceed one week from today") if
			!expire_date.blank? and (expire_date.change({:hour => 0 , :min => 0 , :sec => 0 }) - 1.week) > Date.today
		end


	end
