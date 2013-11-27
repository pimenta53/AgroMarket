require 'spec_helper'

describe "academy/workshops/new" do
  before(:each) do
    assign(:academy_workshop, stub_model(Academy::Workshop,
      :user_id => 1,
      :available_slots => 1,
      :slots_taken => 1,
      :price => 1.5,
      :local => "MyString",
      :description => "MyString",
      :is_delected => 1,
      :requires_registration => 1
    ).as_new_record)
  end

  it "renders new academy_workshop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_workshops_path, "post" do
      assert_select "input#academy_workshop_user_id[name=?]", "academy_workshop[user_id]"
      assert_select "input#academy_workshop_available_slots[name=?]", "academy_workshop[available_slots]"
      assert_select "input#academy_workshop_slots_taken[name=?]", "academy_workshop[slots_taken]"
      assert_select "input#academy_workshop_price[name=?]", "academy_workshop[price]"
      assert_select "input#academy_workshop_local[name=?]", "academy_workshop[local]"
      assert_select "input#academy_workshop_description[name=?]", "academy_workshop[description]"
      assert_select "input#academy_workshop_is_delected[name=?]", "academy_workshop[is_delected]"
      assert_select "input#academy_workshop_requires_registration[name=?]", "academy_workshop[requires_registration]"
    end
  end
end
