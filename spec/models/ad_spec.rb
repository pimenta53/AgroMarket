# == Schema Information
#
# Table name: ads
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  description   :string(255)
#  price         :float
#  expire_date   :datetime
#  location      :string(255)
#  is_active     :binary
#  type_price_id :integer
#  city_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Ad do

	before(:each) do
	    @ad = Ad.new( 
	      :title => "Lorem Ipsum",
	      :price => 19.99,
	      :expire_date => "2013/12/12",
	      :type_price_id => 1,
	      :city_id => 1,
	      :category_id => 1
	    )
	    @user = User.new(:id => 3)
	end

	#novo anuncio com 
	describe 'A new ad' do
		require 'watir-webdriver'
		b = Watir::Browser.new
		b.goto 'localhost:3000/ads/new'
		
		s = b.select_list :name => 'ad[category_id]'
		s.select 'Agricultura'

		b.text_field(:name => 'ad[title]').set 'Legumes Novos'
		b.text_field(:name => 'ad[description]').set 'conjunto de legumes'
		b.text_field(:name => 'ad[price]').set '100'
		b.text_field(:name => 'ad[location]').set 'Legumes Novos'
		sleep 1
		s = b.select_list :name => 'ad[type_price_id]'
		s.select 'Kg'
		
		sleep 1
		s = b.select_list :name => 'ad[city_id]'
		s.select 'Braga'

		btn = b.button :value => 'Submit'
		btn.click
		
		sleep 5
		
		
	end

	describe 'A new ad' do
		  it "expiration date cant be in the past" do
		    @ad.expire_date = "2013/10/12"
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
		    @ad.user_id = @user.id
		    @ad.user_id.should eq(3)
		  end
	end

end
