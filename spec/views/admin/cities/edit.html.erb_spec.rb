require 'spec_helper'

describe "admin/cities/edit" do
  before(:each) do
    @admin_city = assign(:admin_city, stub_model(Admin::City))
  end

  it "renders the edit admin_city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_city_path(@admin_city), "post" do
    end
  end
end
