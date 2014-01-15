class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_notifications
  helper_method :load_stuff_header
  before_action :load_highlights

  protect_from_forgery with: :exception


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end

  def refresh_header
    render :partial => 'layouts/header'
  end

  def load_notifications
    all_notifications = Notification.where(:user_id => current_user, :watched => false)
    
    @notifications_ad_messages  = all_notifications.where(:notification_type => 1)
    @notifications_ad_expired   = all_notifications.where(:notification_type => 2)

    ########notificações de academia#################
    @notifications_new_answer   = all_notifications.where(:notification_type => 4)

    @notification_acmy_new_registration = all_notifications.where(:notification_type => 5 )

    @notification_acmy_aproved = all_notifications.where(:notification_type => [6,7,9] )

    @notification_messages = all_notifications.where(:notification_type => 8 )

    @number_notifications_academy = @notification_acmy_new_registration.length + @notifications_new_answer.length + @notification_acmy_aproved.length
    ######## END notificações de academia#################

  end

  def load_highlights
    @ads_highlights = Ad.ads_highlight
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
