class UsersController < ApplicationController
  layout :resolve_layout
  before_action :set_user, only: [:show, :follow, :myads]
  load_and_authorize_resource :only => [:edit,:update,:show,:index]


  def index
  	@user = User.all
    
  end
  
  #pagina sobre ads do user
  # GET /users/1/myads
  # GET /users/1/myads.json
  def myads
    if params[:page] != nil
      page = params[:page]
    else
      page = 1
    end
    @ads = @user.ads.where("is_deleted = ?", false).paginate(:page => page, :per_page => 8)
    @categories = Category.all
  end

  def myevents
    if params[:page] != nil
      page = params[:page]
    else
      page = 1
    end
    @my_events = Event::Event.where(:user_id => current_user.id).paginate(:page => page, :per_page => 8)
  end

  def myrefpaypal
    @api = PayPal::SDK::AdaptivePayments.new

    # Build request object
    @pay = @api.build_pay({
      :actionType => "PAY",
      :cancelUrl => "http://localhost:3000/samples/adaptive_payments/pay",
      :currencyCode => "EUR",
      :feesPayer => "SENDER",
      :ipnNotificationUrl => "http://localhost:3000/samples/adaptive_payments/ipn_notify",
      :receiverList => {
        :receiver => [{
          :amount => 2.0,
          :email => "platfo_1255612361_per@gmail.com" }] },
      :returnUrl => "http://localhost:3000/samples/adaptive_payments/pay" })

    # Make API call & get response
    @response = @api.pay(@pay)

    # Access response
    if @response.success?
      @response.payKey
      url = @api.payment_url(@response)  # Url to complete payment
      redirect_to url
    else
      @response.error[0].message
    end

    #params = {'cmd' => '_s-xclick','hosted_button_id' => 'ELMDQRCJHUKK8'}
    #redirect_to 'https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=ELMDQRCJHUKK8&return=http://localhost:3000/done_payment?id_payment=coisa'
    #parameters = nil
    #process("https://www.google.pt", "POST", parameters.merge!(:use_route => :my_engine_name) )
    #redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr", :params => params , :method => :post

  end

  def show

    @message = Message.new
    @user_receiver = 1

  end

  # POST /users/1/follow
  def follow
    current_user.toggle_follow(@user)
    respond_to do |format|
      format.html {render :nothing => true}
      format.js {render :nothing => true}
    end
  end

  def new
  end


  private 
  	def set_user
  		@user = User.find(params[:id])
  	end

    def resolve_layout
        case action_name
        when "show" 
             "userslayouts"
        else
          "application"
        end
    end

end
