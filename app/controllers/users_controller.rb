class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :follow]

  def index
  	@user = User.all
  end
  
  # GET /users/myads
  # GET /users/myads.json
  def myads
    @ads = current_user.ads
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


end
