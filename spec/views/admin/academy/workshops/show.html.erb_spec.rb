require 'spec_helper'

describe "admin/academies/show" do
  before(:each) do
    @admin_academy = assign(:admin_academy, stub_model(Admin::Academy::Workshop))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
