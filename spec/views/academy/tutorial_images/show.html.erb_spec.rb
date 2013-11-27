require 'spec_helper'

describe "academy/tutorial_images/show" do
  before(:each) do
    @academy_tutorial_image = assign(:academy_tutorial_image, stub_model(Academy::TutorialImage,
      :tutorial_id => 1,
      :url => "Url",
      :is_deleted => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Url/)
    rendered.should match(/2/)
  end
end
