require 'spec_helper'

describe "admin/publicities/new" do
  before(:each) do
    assign(:admin_publicity, stub_model(Admin::Publicity,
      :title => "MyString",
      :description => "MyString",
      :owner => "MyString",
      :is_deleted => false
    ).as_new_record)
  end

  it "renders new admin_publicity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_publicities_path, "post" do
      assert_select "input#admin_publicity_title[name=?]", "admin_publicity[title]"
      assert_select "input#admin_publicity_description[name=?]", "admin_publicity[description]"
      assert_select "input#admin_publicity_owner[name=?]", "admin_publicity[owner]"
      assert_select "input#admin_publicity_is_deleted[name=?]", "admin_publicity[is_deleted]"
    end
  end
end
