require 'spec_helper'

describe "ads/index" do
  before(:each) do
    assign(:ads, [
      stub_model(Ad,
        :title => "Title",
        :description => "Description",
        :price => 1.5,
        :location => "Location",
        :is_active => "",
        :type_price_id => 1,
        :city_id => 2
      ),
      stub_model(Ad,
        :title => "Title",
        :description => "Description",
        :price => 1.5,
        :location => "Location",
        :is_active => "",
        :type_price_id => 1,
        :city_id => 2
      )
    ])
  end

  it "renders a list of ads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
