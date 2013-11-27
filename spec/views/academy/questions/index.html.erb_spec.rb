require 'spec_helper'

describe "academy/questions/index" do
  before(:each) do
    assign(:academy_questions, [
      stub_model(Academy::Question,
        :user_id => 1,
        :category_id => 2,
        :title => "Title",
        :text => "Text",
        :is_deleted => 3,
        :image_url => "Image Url"
      ),
      stub_model(Academy::Question,
        :user_id => 1,
        :category_id => 2,
        :title => "Title",
        :text => "Text",
        :is_deleted => 3,
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of academy/questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end
