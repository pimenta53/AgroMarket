require 'spec_helper'

describe "admin/academies/index" do
  before(:each) do
    assign(:admin_academy_questions, [
      stub_model(Admin::Academy::Question),
      stub_model(Admin::Academy::Question)
    ])
  end

  it "renders a list of admin/academies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
