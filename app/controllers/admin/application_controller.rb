#encoding: utf-8
class Admin::ApplicationController <  ActionController::Base
  layout "admin"

  before_filter :verify_admin


private
	def verify_admin
		redirect_to root_url unless current_user.user_type == 2
	end



end