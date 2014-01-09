require 'spec_helper'

describe "plans/edit" do
  before(:each) do
    @plan = assign(:plan, stub_model(Plan,
      :name => "MyString",
      :duration => "",
      :price => 1.5,
      :ads_limit => "",
      :event_limit => ""
    ))
  end

  it "renders the edit plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", plan_path(@plan), "post" do
      assert_select "input#plan_name[name=?]", "plan[name]"
      assert_select "input#plan_duration[name=?]", "plan[duration]"
      assert_select "input#plan_price[name=?]", "plan[price]"
      assert_select "input#plan_ads_limit[name=?]", "plan[ads_limit]"
      assert_select "input#plan_event_limit[name=?]", "plan[event_limit]"
    end
  end
end
