class WelcomeController < ApplicationController
  layout false

  def index
  	if user_signed_in? 
  		redirect_to ads_path
  	end
  end


end
