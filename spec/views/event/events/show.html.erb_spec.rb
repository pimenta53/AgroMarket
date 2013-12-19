require 'spec_helper'

describe "event/events/show" do
  before(:each) do
    @event_event = assign(:event_event, stub_model(Event::Event,
      :title => "Title",
      :description => "MyText",
      :user_id => 1,
      :aproved => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
