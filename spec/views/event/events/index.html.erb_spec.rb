require 'spec_helper'

describe "event/events/index" do
  before(:each) do
    assign(:event_events, [
      stub_model(Event::Event,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :aproved => false
      ),
      stub_model(Event::Event,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :aproved => false
      )
    ])
  end

  it "renders a list of event/events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
