class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:name,:username,:city,:birthday,:phone,:email,:password,:password_confirmation)}
  		devise_parameter_sanitizer.for(:account_update) {|user| user.permit(:name,:username,:city,:birthday,:phone,:email,:password,:password_confirmation,:current_password)}
  	end
end
