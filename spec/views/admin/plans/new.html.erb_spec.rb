require 'spec_helper'

describe "admin/plans/new" do
  before(:each) do
    assign(:admin_plan, stub_model(Admin::Plan).as_new_record)
  end

  it "renders new admin_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_plans_path, "post" do
    end
  end
end
