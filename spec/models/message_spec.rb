require 'spec_helper'

describe Message do

	before(:each) do
	    @message = Message.new( 
	      :text => "Lorem Ipsum",
	      :sender_id => 1,
	      :receiver_id => 2,
	      :ad_id => 1,
	      :is_read => 1
	    )
	end

	describe 'A new message ' do
		  it "should have a Ad_id " do
		    @message.ad_id = nil
		    @message.should_not be_valid
		  end

		  it "should have a sender and receiver " do
		    @message.sender_id = nil
		    @message.receiver_id = nil
		    @message.should_not be_valid

		  end

		   it "should have a diferent sender and receiver " do
		    @message.sender_id = 1
		    @message.receiver_id = 1
		    @message.should_not be_valid
		  end

		  it "should have under 144 characters" do
		    @message.text = "sdsdsdsdsdsdssdsdsdsdsdsdsdsdsdsdsjhaklsfjhalkfaldsfgaskjdfhgaskjdfhgaskjdhfgkasjdhfgkasjdhfgkajdsfgkadsjfghaksjdfghaksjhdfgakjdhsfgakjhsdfgkasdjhfgaksjdhfgkajdfghkajdhfg"
		    @message.should_not be_valid
		  end
	end

end