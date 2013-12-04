# == Schema Information
#
# Table name: ads
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :string(255)
#  price          :float
#  expire_date    :datetime
#  location       :string(255)
#  type_price_id  :integer
#  city_id        :integer
#  created_at     :datetime
#  updated_at     :datetime
#  user_id        :integer
#  permanent_link :string(255)
#  category_id    :integer          not null
#  page_views     :integer          default(0)
#  is_deleted     :boolean
#  is_active      :boolean
#

require 'spec_helper'

describe Ad do

	before(:each) do
	    @user = User.new(:id => 3)
	    @ad = Ad.new( 
	      :title => "Lorem Ipsum",
	      :price => 19.99,
	      :expire_date => Date.today + 1.day,
	      :type_price_id => 1,
	      :city_id => 1,
	      :category_id => 1,
	      :user_id => @user.id
	    )
	end

	#novo anuncio com 
	describe 'A new ad' do
		  it "expiration date cant be in the past" do
		    @ad.expire_date = "2012/10/12"
		    @ad.should_not be_valid
		  end
	end
	
	describe 'A new ad' do
		  it "can't exceed one week from today" do
		    @ad.expire_date = Date.today + 1.month
		    @ad.should_not be_valid
		  end
	end

	describe 'A new ad' do
		  it "should have a price" do
		    @ad.price = ""
		    @ad.should_not be_valid
		  end
	end

	describe 'A new ad' do
		  it "should belong to the current_user" do
		   # @ad.user_id = @user.id
		    @ad.user_id.should eq(3)
		  end
	end

	describe 'A new ad' do
		  it "should belong to an user" do
		    @ad.user_id = nil
		    @ad.should_not be_valid
		  end
	end
	
	describe 'A new ad' do
		  it "1 week from today should be a valid limit" do
		    @ad.expire_date = Date.today + 1.week
		    @ad.should be_valid
		  end
	end


end
