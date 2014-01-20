class RegistrationsController < Devise::RegistrationsController
  layout :resolve_layout
  before_action :load_cities, only: [:new, :create, :edit, :update]
  before_action :date_convert, only: [:create,:update]

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

  #omniauth
  def create
    super
    session[:omniauth] = nil unless @user.new_record?
    # => PlanUser(id: integer, user_id: integer, plan_id: integer, created_at: datetime, updated_at: datetime)
    if @user.id
      p = PlanUser.new(:user_id => @user.id, :plan_id => Plan.first.id)
      p.save
      UserMailer.welcome_email(params[:user][:email],params[:user][:name]).deliver
    end

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
		    when "edit","update"
		   	  "userslayouts"
		    else
		      "application"
		    end
		end


		def load_cities
      @districts = District.find(:all ,  :order => "name ASC" ,:include => :cities)
		end

		def date_convert
			begin
        if !params[:user][:birthday].empty?
				  params[:user][:birthday] = DateTime.strptime(params[:user][:birthday],'%d-%m-%Y')
        else
          params[:user][:birthday] = nil
        end
			rescue
				begin
          if !params[:user][:birthday].empty?
					  params[:user][:birthday] = DateTime.strptime(params[:user][:birthday],'%d/%m/%Y')
          else
            params[:user][:birthday] = nil
          end
				rescue
				   @user.errors.add(:birthday, " has invalid format")
					params[:user][:birthday] = nil
				end
			end
		end


	protected
		#redireciona para a página de perfil depois de fazer edit ao perfil
		def after_update_path_for(resource)
      		user_path(resource)
		end
end
