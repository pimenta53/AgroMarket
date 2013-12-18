class AuthenticationsController < ApplicationController
  
  def failure
    flash[:notice] = "Authentication failed."
    redirect_to new_user_session_url
  end
  
  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to refresh_url
    else
      user = User.match_omniauth(omniauth)
      if (user != nil)
        user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
        sign_in_and_redirect(:user, user)
      else
        user = User.new
        user.apply_omniauth(omniauth)
        redirect_to new_user_registration_url
        #if user.save
        #  flash[:notice] = "Signed in successfully."
        #  
        #  #CORRIGEM OS SMTP SETTINGS PLZ
        #  #Dropbox\Agrosocial\business\mails\mail_conf_no_reply.png
        #  #
        #  #UserMailer.new_user_email(user,user.password).deliver
        #  
        #  sign_in_and_redirect(:user, user)
        #else
        #  session[:omniauth] = omniauth.except('extra')
        #  redirect_to new_user_registration_url
        #end
      end
    end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
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