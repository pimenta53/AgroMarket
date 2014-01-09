require 'spec_helper'

describe "plans/index" do
  before(:each) do
    assign(:plans, [
      stub_model(Plan,
        :name => "Name",
        :duration => "",
        :price => 1.5,
        :ads_limit => "",
        :event_limit => ""
      ),
      stub_model(Plan,
        :name => "Name",
        :duration => "",
        :price => 1.5,
        :ads_limit => "",
        :event_limit => ""
      )
    ])
  end

  it "renders a list of plans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
