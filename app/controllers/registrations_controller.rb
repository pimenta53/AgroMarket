class RegistrationsController < Devise::RegistrationsController
    layout :resolve_layout
  	before_action :load_cities, only: [:new, :create, :edit, :update]
  	before_action :date_convert, only: [:create,:update]

  	def new
  		super
  	end

   #omniauth
   def create
     super
     session[:omniauth] = nil unless @user.new_record?
   end
  
  private
      #omniauth
      def build_resource(*args)
        super
        if session[:omniauth]
          @user.apply_omniauth(session[:omniauth])
          @user.valid?
        end
      end 

		def resolve_layout
		    case action_name
		    when "new", "create"
		      "sessions"
		    when "index"
		      "sessions"
		    else
		      "application"
		    end
		end


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
