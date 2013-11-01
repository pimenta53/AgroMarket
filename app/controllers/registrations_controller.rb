class RegistrationsController < Devise::RegistrationsController
  	before_action :load_cities, only: [:new]

	def new
		super
		@cities = City.all
	end

	private 
		def load_cities
			@cities = City.all
		end
end
