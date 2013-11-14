class UsersController < ApplicationController
  
  before_action :set_user, only: [:show]

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

  def new
  end

  private 
  	def set_user
  		@user = User.find(params[:id])
  	end


end
