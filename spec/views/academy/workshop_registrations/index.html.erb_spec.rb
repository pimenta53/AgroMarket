require 'spec_helper'

describe "academy/workshop_registrations/index" do
  before(:each) do
    assign(:academy_workshop_registrations, [
      stub_model(Academy::WorkshopRegistration,
        :workshop_id => 1,
        :user_id => 2,
        :is_deleted => 3
      ),
      stub_model(Academy::WorkshopRegistration,
        :workshop_id => 1,
        :user_id => 2,
        :is_deleted => 3
      )
    ])
  end

  it "renders a list of academy/workshop_registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
