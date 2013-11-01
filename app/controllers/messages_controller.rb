class MessagesController < ApplicationController

	# POST /ads/:ad_id/new_messages
	def create
      	@ad = Ad.find(params[:ad_id])

	    @message = @ad.messages.new(ad_params)
	    # E capaz de faltar uma verificacao
	    @message.save
		
		respond_to do |format|
			if @message.save
	        	format.html { redirect_to ad_path(@ad) }
	        else
	        	format.html
	        end
	    end
	    
	end
  
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:message).permit(:text, :sender_id, :ad_id, :receiver_id, :is_read )
    end
end
