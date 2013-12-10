class SessionsController < Devise::SessionsController

	layout "sessions"


	def new
		super
	end

	def create
	  super
      set_flash_message(:notice, :signed_in) if is_flashing_format?

	end
end
