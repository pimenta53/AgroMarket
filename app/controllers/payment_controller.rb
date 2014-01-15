class PaymentController < ApplicationController
	before_action :set_payment, only: [:create_payment]


	PayPal::SDK.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')
  	require 'paypal-sdk-adaptivepayments'

  	def create_payment
  		@api = PayPal::SDK::AdaptivePayments.new

  		random_ref = (0...15).map { ('A'..'Z').to_a[rand(26)] }.join
  		payment_ref = Payment.new(:user_id => current_user.id,:ref => random_ref,:plan_id => params[:id],:payment_type => 1)

	    # Build request object
	    @pay = @api.build_pay({
	      :actionType => "PAY",
	      :cancelUrl => "http://localhost:3000/payment/error_payment",
	      :currencyCode => "EUR",
	      :feesPayer => "SENDER",
	      :description => "Coisa para description" ,
	      :ipnNotificationUrl => "http://localhost:3000/asdfajklaslkdpayment/success_payment?user=#{current_user.id}&code=#{payment_ref}",
	      :receiverList => {
	        :receiver => [{
	          :amount => @plan.price,
	          :email => "platfo_1255612361_per@gmail.com" }] },
	      :returnUrl => "http://localhost:3000/payment/success_payment?user=#{current_user.id}&code=#{payment_ref.ref}" })

	    # Make API call & get response
	    @response = @api.pay(@pay)

	    # Access response
	    if @response.success?
	      @response.payKey
	      url = @api.payment_url(@response)  # Url to complete payment
	      payment_ref.save
	      redirect_to url
	    else
	      @response.error[0].message
	    end
  	end

  	def success_payment
  		payment_find = Payment.where(:ref => params[:code],:used => false,:user_id => params[:user]).first
  		
  		if !payment_find.nil?
  			payment_find.used = true
	  		payment_find.save
	  		@payment_find = payment_find
  			if payment_find.payment_type == 2 ##CASO O PAGAMENTO SEJA PARA PROMOVER UM ANUNCIO
  				@ad = Ad.find(payment_find.ad_id)
  				@ad.highlight
  				@ad.save
  			else ##CASO SEJA A COMPRAR UM PACOTE
	  			
	  			PlanUser.create(:user_id => payment_find.user_id,:plan_id => payment_find.plan_id)
  			end
  		else 
  			redirect_to error_payment_path
  		end
  	end

  	def error_payment
  		
  	end

  	def promove_ad_payment
  		@api = PayPal::SDK::AdaptivePayments.new
 
  		random_ref = (0...15).map { ('A'..'Z').to_a[rand(26)] }.join
  		payment_ref = Payment.new(:user_id => current_user.id,:ref => random_ref,:plan_id => -99, :payment_type => 2, :ad_id => params[:id])

	    # Build request object
	    @pay = @api.build_pay({
	      :actionType => "PAY",
	      :cancelUrl => "http://localhost:3000/payment/error_payment",
	      :currencyCode => "EUR",
	      :feesPayer => "SENDER",
	      :description => "Coisa para description" ,
	      :ipnNotificationUrl => "http://localhost:3000/asdfajklaslkdpayment/success_payment?user=#{current_user.id}&code=#{payment_ref}",
	      :receiverList => {
	        :receiver => [{
	          :amount => 2.50,
	          :email => "platfo_1255612361_per@gmail.com" }] },
	      :returnUrl => "http://localhost:3000/payment/success_payment?user=#{current_user.id}&code=#{payment_ref.ref}" })

	    # Make API call & get response
	    @response = @api.pay(@pay)

	    # Access response
	    if @response.success?
	      @response.payKey
	      url = @api.payment_url(@response)  # Url to complete payment
	      payment_ref.save
	      redirect_to url
	    else
	      @response.error[0].message
	    end
  	end


  	private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_payment
	    	@plan = Plan.find(params[:id])
	    end


end
