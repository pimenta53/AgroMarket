#encoding: utf-8
class MessagesController < ApplicationController


	#caixa de entrada das mensagens
	def index
	   @messages = Message.conversations( current_user.id )
	end

	def show
		@messages = Message.conversation(current_user.id , params[:id] )
	end
	# POST /ads/:ad_id/new_messages
	def create

      	@ad = Ad.find(params[:ad_id])
	    @message = @ad.messages.new(ad_params)
	    
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
