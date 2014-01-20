class FeedsController < ApplicationController
	def index
		if current_user.blank?
			redirect_to user_session_path
		else	
         if params[:page] != nil
            page = params[:page]
         else
            page = 1
         end
         
         
         
				@feeds = Feed.where("user_id=?",current_user.id).order('created_at DESC').paginate(:page => page, :per_page => 10)

				@elem_feed = Array.new
				if !@feeds.blank? 


					@feeds.each do | f |

						require 'ostruct'
						info = OpenStruct.new

						info.in = f.in				
						
						case f.in
						when 1    #ad
							info.content = Ad.find_by_id(f.id_content)
						when 2    #question
							info.content = Academy::Question.find_by_id(f.id_content)
						when 3    #tutorial
							info.content = Academy::Tutorial.find_by_id(f.id_content)
						when 4    #event
							info.content = Event::Event.find_by_id(f.id_content)
						when 5    #WS
							info.content = Academy::Workshop.find_by_id(f.id_content)
						
						end

						@elem_feed.push(info)
					end

				end

				#render "index"
    			respond_to do |format|
    			  format.html
     			  format.js {render :layout => false}
    			end

			end
	end 
end
