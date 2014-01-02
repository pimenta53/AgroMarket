class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_notifications
  helper_method :load_stuff_header

  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end

  def refresh_header
    render :partial => 'layouts/header'
  end

  def load_notifications
    @ad_notifications = Notification::Ad.where(:user_id => current_user, :watched => false)

  end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up) {|user| user.permit(:avatar,:name,:username,:city_id,:birthday,:phone,:email,:password,:password_confirmation)}
  		devise_parameter_sanitizer.for(:account_update) {|user| user.permit(:avatar,:name,:username,:city_id,:birthday,:phone,:email,:password,:password_confirmation,:current_password,:ocupation)}
  	end

  	def load_stuff_header
  		if user_signed_in?
  			Rating.where(:rater_id => current_user.id,:rate => nil).count
  		end
  	end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      redirect_path
    else
      super
    end
  end
end
