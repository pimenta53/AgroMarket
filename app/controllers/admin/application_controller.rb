#encoding: utf-8
class Admin::ApplicationController <  ActionController::Base
  load_and_authorize_resource

  layout "admin"
  

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end


end