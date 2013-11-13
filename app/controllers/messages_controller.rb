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

    # verificar se existe takl entre os dois utilizadores
    # se existir
    # => obter o id da talk
    #senao
    # => criar uma nova talk
    # criar a nova message
    # adicionar a message ao takl

    talk = Talk.where("((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) and ad_id = ?", current_user.id, @ad.user_id, @ad.user_id, current_user.id, @ad.id).first
    if !talk
      talk = Talk.new()
    end
    
    @message = talk.messages.new(ad_params)

    

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
      params.require(:message).permit(:text, :user_sender, :is_read )
    end
end
