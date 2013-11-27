require 'spec_helper'

describe "academy/workshops/show" do
  before(:each) do
    @academy_workshop = assign(:academy_workshop, stub_model(Academy::Workshop,
      :user_id => 1,
      :available_slots => 2,
      :slots_taken => 3,
      :price => 1.5,
      :local => "Local",
      :description => "Description",
      :is_delected => 4,
      :requires_registration => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/1.5/)
    rendered.should match(/Local/)
    rendered.should match(/Description/)
    rendered.should match(/4/)
    rendered.should match(/5/)
  end
end
