class MessageObserver < ActiveRecord::Observer
	observe :message

	def after_create( message)
		#faz qualquer coisa
    end

end
