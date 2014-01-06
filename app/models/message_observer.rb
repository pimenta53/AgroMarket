class MessageObserver < ActiveRecord::Observer
	observe :message

	def after_create( message)
       	
    end

end
