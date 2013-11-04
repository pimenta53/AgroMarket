class RegistrationsController < Devise::RegistrationsController
  	before_action :load_cities, only: [:new, :create, :edit, :update]
  	before_action :date_convert, only: [:create,:update]

	def new
		super
	end

	private 
		def load_cities
			@cities = City.all
		end

		def date_convert
			params[:user][:birthday] = DateTime.strptime(params[:user][:birthday],'%Y-%m-%d')
		end
end
