class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :load_stuff_header

  protect_from_forgery with: :exception

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:avatar,:name,:username,:city_id,:birthday,:phone,:email,:password,:password_confirmation)}
  		devise_parameter_sanitizer.for(:account_update) {|user| user.permit(:avatar,:name,:username,:city_id,:birthday,:phone,:email,:password,:password_confirmation,:current_password)}
  	end

  	def load_stuff_header
  		if user_signed_in? 
  			Rating.where(:rater_id => current_user.id,:rate => nil).count
  		end
  	end
end
