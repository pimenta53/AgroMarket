class SessionsController < Devise::SessionsController
	layout "sessions"

	def new
		super
	end

	def create
	  super
	end
end
