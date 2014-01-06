require 'spec_helper'

describe "admin/publicities/index" do
  before(:each) do
    assign(:admin_publicities, [
      stub_model(Admin::Publicity,
        :title => "Title",
        :description => "Description",
        :owner => "Owner",
        :is_deleted => false
      ),
      stub_model(Admin::Publicity,
        :title => "Title",
        :description => "Description",
        :owner => "Owner",
        :is_deleted => false
      )
    ])
  end

  it "renders a list of admin/publicities" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
