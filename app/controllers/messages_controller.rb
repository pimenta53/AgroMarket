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

    #mark notification as watched, if params[:notification] is set
    if params.has_key?(:notification) && (Integer(params[:notification]) rescue nil)
      Notification.find(params[:notification]).update(:watched => true)
    end
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
        #notify the owner of the Workshop
        #verificar ja existe uma notificacao referente a esta conversacao
        if Notification.have_notification_message?( @talk.user_receiver(current_user.id), @talk.id ) == false
          Notification.create_notification( @talk.user_receiver(current_user.id) , @talk.id, 9 , "Tem novas Mensagens")
        end

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
        UserMailer.delay.send_message_ad(@talk.user_receiver_email(current_user.id),current_user.name,@ad.title,params[:message][:text])

        
        #if doesnt exist, create a notification for the other user and save it
        if Notification.where(:user_id => @talk.user_receiver(current_user.id), :id_destination => @ad.id, :notification_type => 1, :watched => false).empty?
          ad_notify = Notification.new(:user_id => @talk.user_receiver(current_user.id), :id_destination => @ad.id)
          ad_notify.set_type(:ad_message)
          ad_notify.save
        end

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
