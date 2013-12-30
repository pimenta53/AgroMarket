#encoding: utf-8
class MessagesController < ApplicationController
  load_and_authorize_resource :only => [:edit,:update,:show,:index]


	#caixa de entrada com todas mensagens
  def index
     @talks_privates = current_user.private_talks
     @talks_ads = current_user.ads_talks

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
    @talk = Talk.talk_mp( current_user , user_two )

    #verify if exists
    if !@talk
      @talk = Talk.new(:user_one => current_user.id, :user_two=> user_two.id )

      if @talk.save == false
        redirect_to user_path(user_two)
        return
      end
    end

    #create the new message in talk
    @message = @talk.messages.new(ad_params)
    @message.user_sender = current_user.id

    path = params[:message][:path]

      if @message.save
        @messages = @talk.messages
         render :partial => 'create_mp.js.erb'
      end

  end

	# create new message inside an ad
	def create

    #get the ad
    @ad = Ad.find(params[:ad_id])

    # select the talk between the logged user and the owner from this ad, if any exists
    @talk = Talk.where( "((user_one = ? and user_two = ?) or (user_one = ? and user_two = ?)) and ad_id = ? and is_close != 1", current_user.id, params[:message][:user_id].to_i, params[:message][:user_id].to_i, current_user.id, @ad.id ).first

    # if there is no talk between the logged user and the owner from this ad
    # => create a new one
    # => and save it
    if @talk.nil?
      @talk = Talk.new(:user_one => current_user.id, :user_two => @ad.user_id, :ad_id => @ad.id)
      @talk.save
    end

    #create the message
    @message = @talk.messages.new(ad_params)
    #add the sender
    @message.user_sender = current_user.id

    @talks = Talk.all_talk_ad(current_user , @ad)

    #save the new message
    if @message.save
        @messages = @talk.messages
        @message = Message.new

        ad_notify = Notification::Ad.new(:user_id => @talk.user_receiver(current_user.id), :ad_id => @ad.id)

        #render :partial => 'create.js.erb'
        redirect_to @ad
    end
	end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:message).permit(:text)
    end
end
