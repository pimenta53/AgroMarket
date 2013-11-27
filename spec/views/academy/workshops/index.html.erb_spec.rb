require 'spec_helper'

describe "academy/workshops/index" do
  before(:each) do
    assign(:academy_workshops, [
      stub_model(Academy::Workshop,
        :user_id => 1,
        :available_slots => 2,
        :slots_taken => 3,
        :price => 1.5,
        :local => "Local",
        :description => "Description",
        :is_delected => 4,
        :requires_registration => 5
      ),
      stub_model(Academy::Workshop,
        :user_id => 1,
        :available_slots => 2,
        :slots_taken => 3,
        :price => 1.5,
        :local => "Local",
        :description => "Description",
        :is_delected => 4,
        :requires_registration => 5
      )
    ])
  end

  it "renders a list of academy/workshops" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Local".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
