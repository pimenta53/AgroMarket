# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe '#destroy' do
  
  before(:each) do
	    @category = Category.first
  end


  context 'when category has ads' do
  	it "should not destroy" do
     expect { delete :destroy, :id => @category.id }.should_not change(Category, :count)
    end

  end

  
end
