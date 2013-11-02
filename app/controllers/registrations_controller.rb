class RegistrationsController < Devise::RegistrationsController
  	before_action :load_cities, only: [:new, :create]

	def new
		super
	end

	private 
		def load_cities
			@cities = City.all
		end
end
