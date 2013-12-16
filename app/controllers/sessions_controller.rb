class SessionsController < Devise::SessionsController

	layout "sessions"


	def new
		super
    @user = User.new
	end

	def create
	  super
	end
end
