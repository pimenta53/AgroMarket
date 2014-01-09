module ApplicationHelper

	def academy?
	    controller.class.name.split("::").first=="Academy"
	end


   #Publicity globals
   $publicity_offset = rand(0..(Admin::Publicity.where("is_deleted = false and (expire_date is null or expire_date >= ?)", Date.today).count-1))

   def get_publicity(count)
     if (!$publicity_offset)
       $publicity_offset = rand(0..(Admin::Publicity.where("is_deleted = false and (expire_date is null or expire_date >= ?)", Date.today).count-1))
     end
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


end
