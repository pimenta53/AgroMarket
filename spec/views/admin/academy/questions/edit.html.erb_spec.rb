require 'spec_helper'

describe "admin/academies/edit" do
  before(:each) do
    @admin_academy = assign(:admin_academy, stub_model(Admin::Academy::Question))
  end

  it "renders the edit admin_academy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_academy_path(@admin_academy), "post" do
    end
  end
end
