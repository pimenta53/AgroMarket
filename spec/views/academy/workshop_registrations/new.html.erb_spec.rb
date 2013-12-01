require 'spec_helper'

describe "academy/workshop_registrations/new" do
  before(:each) do
    assign(:academy_workshop_registration, stub_model(Academy::WorkshopRegistration,
      :workshop_id => 1,
      :user_id => 1,
      :is_deleted => 1
    ).as_new_record)
  end

  it "renders new academy_workshop_registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_workshop_registrations_path, "post" do
      assert_select "input#academy_workshop_registration_workshop_id[name=?]", "academy_workshop_registration[workshop_id]"
      assert_select "input#academy_workshop_registration_user_id[name=?]", "academy_workshop_registration[user_id]"
      assert_select "input#academy_workshop_registration_is_deleted[name=?]", "academy_workshop_registration[is_deleted]"
    end
  end
end
