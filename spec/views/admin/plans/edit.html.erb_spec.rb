require 'spec_helper'

describe "admin/plans/edit" do
  before(:each) do
    @admin_plan = assign(:admin_plan, stub_model(Admin::Plan))
  end

  it "renders the edit admin_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_plan_path(@admin_plan), "post" do
    end
  end
end
