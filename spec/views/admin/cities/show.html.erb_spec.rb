require 'spec_helper'

describe "admin/cities/show" do
  before(:each) do
    @admin_city = assign(:admin_city, stub_model(Admin::City))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
