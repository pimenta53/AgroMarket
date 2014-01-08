require 'spec_helper'

describe "admin/cities/new" do
  before(:each) do
    assign(:admin_city, stub_model(Admin::City).as_new_record)
  end

  it "renders new admin_city form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_cities_path, "post" do
    end
  end
end
