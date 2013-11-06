class RegistrationsController < Devise::RegistrationsController
    layout "sessions"
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
			begin
				params[:user][:birthday] = DateTime.strptime(params[:user][:birthday],'%Y-%m-%d')
			rescue
				params[:user][:birthday] = nil
			end
		end
end
