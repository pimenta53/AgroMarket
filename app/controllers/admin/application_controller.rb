#encoding: utf-8
class Admin::ApplicationController <  ActionController::Base
  layout "admin"
  load_and_authorize_resource :only => [:edit]
  

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end


end