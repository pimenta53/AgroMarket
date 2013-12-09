#encoding: utf-8
class MessagesController < ApplicationController


	#caixa de entrada com todas mensagens
  def index
     @talks = current_user.all_talks
  end

  def show
    @talk = Talk.find(params[:id])
    #id do user receiver
    @user_receiver_id = @talk.user_receiver( current_user.id )

    @messages = @talk.messages

    @message = Message.new
  end


  # create new Private Messages
  def create_mp

    #user receiver
    user_two = User.find(params[:message][:user_two].to_i)

    #get the talk of private messages of 2 users
    talk = Talk.talk_mp( current_user , user_two )

    #verify if exists
    if !talk
      talk = Talk.new(:user_one => current_user.id, :user_two=> user_two.id )

      if talk.save == false
        redirect_to user_path(user_two)
        return
      end
    end

    #create the new message in talk
    @message = talk.messages.new(ad_params)
    @message.user_sender = current_user.id


    path = params[:message][:path]
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to path }
      else
        format.html
      end
    end
  end

	# create new message
	def create
    @ad = Ad.find(params[:ad_id])

    # select all unclosed talks between both users and from this ad 
    talk = Talk.where( "((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) and ad_id = ? and is_close != 1", current_user.id, params[:message][:user_id], params[:message][:user_id], current_user.id, @ad.id ).first
    
    # if there is no talk between both users in this ad
    # => create a new one 
    # => and save it
    if !talk
      talk = Talk.new(:user_one => current_user.id, :user_two => @ad.user_id, :ad_id => @ad.id)
      talk.save
    end

    @message = talk.messages.new(ad_params)
    @message.user_sender = current_user.id

    respond_to do |format|
      if  @message.save
        format.html { redirect_to ad_path(@ad) }
      else
        format.html
      end
    end
	end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:message).permit(:text)
    end
end
