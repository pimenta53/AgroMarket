module ApplicationHelper

	def academy?
	    controller.class.name.split("::").first=="Academy"
	end

end
