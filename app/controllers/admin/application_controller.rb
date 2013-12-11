#encoding: utf-8
class Admin::ApplicationController <  ActionController::Base
  before_action :set_premission

  layout "admin"
  

  private
  	def set_premission
  		if current_user.nil?
  			redirect_to root_path
  		else
  			if !current_user.user_type.nil?
		  		if current_user.user_type == 1
		  			redirect_to ads_path, :notice => "Boa sorte, não consegues entrar porque não és ADMIN, se quiseres pede ao LIMA"
		  		end
		  	end
	  	end
  	end


end