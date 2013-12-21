require 'spec_helper'

describe "admin/academies/new" do
  before(:each) do
    assign(:admin_academy, stub_model(Admin::Academy::Question).as_new_record)
  end

  it "renders new admin_academy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_academy_questions_path, "post" do
    end
  end
end
