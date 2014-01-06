require 'spec_helper'

describe "admin/publicities/edit" do
  before(:each) do
    @admin_publicity = assign(:admin_publicity, stub_model(Admin::Publicity,
      :title => "MyString",
      :description => "MyString",
      :owner => "MyString",
      :is_deleted => false
    ))
  end

  it "renders the edit admin_publicity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_publicity_path(@admin_publicity), "post" do
      assert_select "input#admin_publicity_title[name=?]", "admin_publicity[title]"
      assert_select "input#admin_publicity_description[name=?]", "admin_publicity[description]"
      assert_select "input#admin_publicity_owner[name=?]", "admin_publicity[owner]"
      assert_select "input#admin_publicity_is_deleted[name=?]", "admin_publicity[is_deleted]"
    end
  end
end
