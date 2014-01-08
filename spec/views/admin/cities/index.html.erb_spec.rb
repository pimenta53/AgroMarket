require 'spec_helper'

describe "admin/cities/index" do
  before(:each) do
    assign(:admin_cities, [
      stub_model(Admin::City),
      stub_model(Admin::City)
    ])
  end

  it "renders a list of admin/cities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
