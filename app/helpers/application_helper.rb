module ApplicationHelper

	def academy?
	    controller.class.name.split("::").first=="Academy"
	end

	def in_academy?
		controller.class.name.split("::").first == "Academy" ? 'in' : ''
	end

	def in_events?
		controller.class.name.split("::").first == "Event" ? 'in' : ''
	end

	def in_mercado?
		controller.controller_name == "ads" || controller.controller_name == "users" ? 'in' : ''
	end



end
