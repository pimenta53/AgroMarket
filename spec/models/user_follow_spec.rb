# == Schema Information
#
# Table name: user_follows
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  following_id :integer
#

require 'spec_helper'

describe UserFollow do

	before(:each) do
	    @user1 = User.new(:id => 1)
	    @user2 = User.new(:id => 2)
	    @follow = UserFollow.new( 
	      :user_id => 1, 
	      :following_id => 2
	    )
	end
	
	describe 'A new follow' do
		it "creation should be valid" do
		   @follow.should be_valid
	   end
	end
	
	describe 'A new follow' do
		it "shouldn't follow himself" do
	      @follow.user_id = 1 
	      @follow.following_id = 1
			@follow.should_not be_valid
	   end
	end
end
