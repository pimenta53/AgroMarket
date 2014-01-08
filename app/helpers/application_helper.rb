module ApplicationHelper

	def academy?
	    controller.class.name.split("::").first=="Academy"
	end

   #Publicity globals
   $publicity_offset = 0   
   
   def get_publicity(count)
     fetch_result = Admin::Publicity.get_publicity_with_offset($publicity_offset, count)
      
     $publicity_offset = fetch_result["offset"]
     fetch_result["list"]
   end
end
