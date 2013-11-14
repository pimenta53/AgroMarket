#encoding: utf-8
class MessagesController < ApplicationController


	#caixa de entrada com todas mensagens
  def index
     @talks = Talk.all_talks( current_user.id )
  end

  def show
    @talk = Talk.find(params[:id])
    @user_receiver_id = @talk.user_receiver( current_user.id )

    @messages = @talk.messages

    @message = Message.new
  end


  # create new Private Messages
  def create_mp

    user_two = User.find(params[:message][:user_two].to_i)

    talk = Talk.where("((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) ", current_user.id, user_two.id, user_two.id, current_user.id).first

    if !talk
      talk = Talk.new(:user_one => current_user.id, :user_two=> user_two.id )

      if talk.save == false
        redirect_to user_path(user_two)
        return
      end
    end
    
    @message = talk.messages.new(ad_params)

    
    respond_to do |format|
      if @message.save
        format.html { redirect_to user_path(user_two) }
      else
        format.html
      end
    end
  end

	# create new message
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
