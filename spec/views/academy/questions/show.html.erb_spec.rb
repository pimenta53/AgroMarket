require 'spec_helper'

describe "academy/questions/show" do
  before(:each) do
    @academy_question = assign(:academy_question, stub_model(Academy::Question,
      :user_id => 1,
      :category_id => 2,
      :title => "Title",
      :text => "Text",
      :is_deleted => 3,
      :image_url => "Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Title/)
    rendered.should match(/Text/)
    rendered.should match(/3/)
    rendered.should match(/Image Url/)
  end
end
