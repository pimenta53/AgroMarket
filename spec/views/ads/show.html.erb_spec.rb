require 'spec_helper'

describe "ads/show" do
  before(:each) do
    @ad = assign(:ad, stub_model(Ad,
      :title => "Title",
      :description => "Description",
      :price => 1.5,
      :location => "Location",
      :is_active => "",
      :type_price_id => 1,
      :city_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/1.5/)
    rendered.should match(/Location/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
