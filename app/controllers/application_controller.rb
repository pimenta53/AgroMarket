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

  # Load all notifications
  # => 1 -> new message in ad
  # => 2 -> ad expired
  # => 3 -> ad deleted by admin
  # => 4 -> new answer for your question
  # => 5 -> New registration in your workshop
  # => 6 -> Aproved tutorial
  # => 7 -> Aproved Event
  # => 8 -> Aproved workshop
  # => 9 -> new private message
  def load_notifications
    all_notifications = Notification.where(:user_id => current_user, :watched => false)

    # notification from ads
    @notifications_ad_messages  = all_notifications.where(:notification_type => 1)
    @notifications_ad_expired   = all_notifications.where(:notification_type => 2)

    @number_notifications_ads   = @notifications_ad_messages.size + @notifications_ad_expired.size

    ########notificações de academia#################
    @notifications_new_answer           = all_notifications.where(:notification_type => 4)
    @notification_acmy_new_registration = all_notifications.where(:notification_type => 5 )
    #@notification_acmy_aproved          = all_notifications.where(:notification_type => [6,7,8] )
    @notification_acmy_tutorial_aproved = all_notifications.where(:notification_type => 6 )
    @notification_acmy_event_aproved    = all_notifications.where(:notification_type => 7 )
    @notification_acmy_workshop_aproved = all_notifications.where(:notification_type => 9 )

    @number_notifications_academy = @notifications_new_answer.size + @notification_acmy_new_registration.size + @notification_acmy_tutorial_aproved.size +  @notification_acmy_event_aproved.size + @notification_acmy_workshop_aproved.size

    # notifications from personal messages
    @notification_messages = all_notifications.where(:notification_type => 8 )

    #total = notific-academia + notific-ads + notific-messages
    @total_new_notification =  @number_notifications_academy +  @number_notifications_ads +  @notification_messages.size


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
