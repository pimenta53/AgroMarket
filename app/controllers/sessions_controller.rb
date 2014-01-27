class SessionsController < Devise::SessionsController

	layout "sessions"


	def new
		super
    	@user = User.new
	end

	def create

		if !current_user.nil?
			if current_user.deleted 
				sign_out current_user
				flash[:notice] = "Erro, a sua conta foi apagada a sua reativação será possível em breve."
				redirect_to user_session_path 
			else
				super
		  	end
		else
			super
		end
		
	end

end
