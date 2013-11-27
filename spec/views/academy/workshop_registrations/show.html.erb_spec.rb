require 'spec_helper'

describe "academy/workshop_registrations/show" do
  before(:each) do
    @academy_workshop_registration = assign(:academy_workshop_registration, stub_model(Academy::WorkshopRegistration,
      :workshop_id => 1,
      :user_id => 2,
      :is_deleted => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
