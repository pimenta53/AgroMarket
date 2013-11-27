require 'spec_helper'


describe Talk do

	before(:each) do
	    @user1 = User.new(:id => 1)
	    @user2 = User.new(:id => 2)
	    @talk = Talk.new( 
	      :user_one => 1, 
	      :user_two => 2
	    )
	end
	
	describe 'A new talk' do
		it "normal create should be valid" do
		   @talk.should be_valid
	   end
	end
	
	describe 'A new talk' do
		it "shouldn't talk to yourself" do
	      @talk.user_one = 1 
	      @talk.user_two = 1
			@talk.should_not be_valid
	   end
	end
end
