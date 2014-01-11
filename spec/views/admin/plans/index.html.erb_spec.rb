require 'spec_helper'

describe "admin/plans/index" do
  before(:each) do
    assign(:admin_plans, [
      stub_model(Admin::Plan),
      stub_model(Admin::Plan)
    ])
  end

  it "renders a list of admin/plans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
