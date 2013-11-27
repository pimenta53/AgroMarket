require 'spec_helper'

describe "academy/tutorials/index" do
  before(:each) do
    assign(:academy_tutorials, [
      stub_model(Academy::Tutorial,
        :category_id => 1,
        :user_id => 2,
        :aproved => 3,
        :title => "Title",
        :text => "Text",
        :is_delected => 4
      ),
      stub_model(Academy::Tutorial,
        :category_id => 1,
        :user_id => 2,
        :aproved => 3,
        :title => "Title",
        :text => "Text",
        :is_delected => 4
      )
    ])
  end

  it "renders a list of academy/tutorials" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
