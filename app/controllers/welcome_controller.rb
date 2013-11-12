class WelcomeController < ApplicationController
  
  def index
  	if user_signed_in? 
  		@last_message = Message.where(:receiver_id => current_user.id).last(3)
  	end
  end

end
