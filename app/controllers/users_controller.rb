class UsersController < ApplicationController
  layout :resolve_layout
  before_action :set_user, only: [:show, :follow, :myads]
  load_and_authorize_resource :only => [:edit,:update,:show,:index]

  def index
  	@user = User.all
    
  end
  
  #pagina sobre ads do user
  # GET /users/1/myads
  # GET /users/1/myads.json
  def myads
    @ads = @user.ads
    @categories = Category.all
  end

  def show

    @message = Message.new
    @user_receiver = 1

  end

  # POST /users/1/follow
  def follow
    current_user.toggle_follow(@user)
    respond_to do |format|
      format.html {render :nothing => true}
      format.js {render :nothing => true}
    end
  end

  def new
  end


  private 
  	def set_user
  		@user = User.find(params[:id])
  	end

    def resolve_layout
        case action_name
        when "show" 
             "userslayouts"
        else
          "application"
        end
    end

end
