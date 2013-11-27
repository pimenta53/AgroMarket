require 'spec_helper'

describe "academy/answers/show" do
  before(:each) do
    @academy_answer = assign(:academy_answer, stub_model(Academy::Answer,
      :question_id => 1,
      :user_id => 2,
      :up => 3,
      :down => 4,
      :is_deleted => 5,
      :image_url => "Image Url",
      :text => "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/Image Url/)
    rendered.should match(/Text/)
  end
end
