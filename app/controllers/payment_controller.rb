class PaymentController < ApplicationController
	PayPal::SDK.load('config/paypal.yml',  ENV['RACK_ENV'] || 'development')
  	require 'paypal-sdk-adaptivepayments'

  	def create_payment

  	end

  	def success_payment
  	end

  	def error_payment
  	end

end
