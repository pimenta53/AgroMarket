require 'spec_helper'

describe "admin/plans/show" do
  before(:each) do
    @admin_plan = assign(:admin_plan, stub_model(Admin::Plan))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
