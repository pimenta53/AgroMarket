require 'spec_helper'

describe "event/events/edit" do
  before(:each) do
    @event_event = assign(:event_event, stub_model(Event::Event,
      :title => "MyString",
      :description => "MyText",
      :user_id => 1,
      :aproved => false
    ))
  end

  it "renders the edit event_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_event_path(@event_event), "post" do
      assert_select "input#event_event_title[name=?]", "event_event[title]"
      assert_select "textarea#event_event_description[name=?]", "event_event[description]"
      assert_select "input#event_event_user_id[name=?]", "event_event[user_id]"
      assert_select "input#event_event_aproved[name=?]", "event_event[aproved]"
    end
  end
end
