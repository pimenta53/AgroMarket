require 'spec_helper'

describe "admin/academies/index" do
  before(:each) do
    assign(:admin_academy_workshops, [
      stub_model(Admin::Academy::Workshop),
      stub_model(Admin::Academy::Workshop)
    ])
  end

  it "renders a list of admin/academies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
