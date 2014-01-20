class AuthenticationsController < ApplicationController
  
  def failure
    flash[:notice] = I18n.t('devise.sessions.failure')
    redirect_to new_user_session_url
  end
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = I18n.t('devise.sessions.signed_in')
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.omni_authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = I18n.t('devise.sessions.signed_in')
      redirect_to refresh_url
    else
      user = User.match_omniauth(omniauth)
      if (user != nil)
        user.omni_authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
        sign_in_and_redirect(:user, user)
      else
        user = User.new
        user.apply_omniauth(omniauth)
        if user.save
          p = PlanUser.new(:user_id => user.id, :plan_id => Plan.first.id)
          p.save
          
          flash[:notice] = I18n.t('devise.sessions.signed_in')
          #CORRIGEM OS SMTP SETTINGS PLZ
          #Dropbox\Agrosocial\business\mails\mail_conf_no_reply.png
          #
          #UserMailer.new_user_email(user,user.password).deliver
          
          sign_in_and_redirect(:user, user)
        else
          session[:omniauth] = omniauth.except('extra')
          redirect_to new_user_registration_url
        end
      end
    end
  end
  
  def destroy
    @authentication = current_user.omni_authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to root_path
  end
  
  protected
  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end
end