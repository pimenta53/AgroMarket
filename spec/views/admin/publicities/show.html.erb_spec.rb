require 'spec_helper'

describe "admin/publicities/show" do
  before(:each) do
    @admin_publicity = assign(:admin_publicity, stub_model(Admin::Publicity,
      :title => "Title",
      :description => "Description",
      :owner => "Owner",
      :is_deleted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/Owner/)
    rendered.should match(/false/)
  end
end
