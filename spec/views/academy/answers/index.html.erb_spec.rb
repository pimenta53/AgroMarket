require 'spec_helper'

describe "academy/answers/index" do
  before(:each) do
    assign(:academy_answers, [
      stub_model(Academy::Answer,
        :question_id => 1,
        :user_id => 2,
        :up => 3,
        :down => 4,
        :is_deleted => 5,
        :image_url => "Image Url",
        :text => "Text"
      ),
      stub_model(Academy::Answer,
        :question_id => 1,
        :user_id => 2,
        :up => 3,
        :down => 4,
        :is_deleted => 5,
        :image_url => "Image Url",
        :text => "Text"
      )
    ])
  end

  it "renders a list of academy/answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
  end
end
