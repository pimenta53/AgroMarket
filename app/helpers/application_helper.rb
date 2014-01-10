module ApplicationHelper

	def academy?
	    controller.class.name.split("::").first=="Academy"
	end


   #Publicity globals
   $publicity_offset = rand(0..(Admin::Publicity.where("is_deleted = false and (expire_date is null or expire_date >= ?)", Date.today).count-1))

   def get_publicity(count)
     fetch_result = Admin::Publicity.get_publicity_with_offset($publicity_offset, count)

     $publicity_offset = fetch_result["offset"]
     fetch_result["list"]
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

	def check_type_notification( notification )
		if notification.notification_type == 6
			return link_to '<span class="name">'.html_safe + notification.description + '</span>'.html_safe , academy_tutorial_path(notification.id_destination ,  :notification => notification) 
		elsif notification.notification_type == 7
			return link_to '<span class="name">'.html_safe + notification.description + '</span>'.html_safe , event_event_path(notification.id_destination ,  :notification => notification) 
		end
	end
	


end
