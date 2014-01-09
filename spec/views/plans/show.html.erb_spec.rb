require 'spec_helper'

describe "plans/show" do
  before(:each) do
    @plan = assign(:plan, stub_model(Plan,
      :name => "Name",
      :duration => "",
      :price => 1.5,
      :ads_limit => "",
      :event_limit => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
    rendered.should match(/1.5/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
