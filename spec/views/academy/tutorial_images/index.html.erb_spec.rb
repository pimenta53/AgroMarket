require 'spec_helper'

describe "academy/tutorial_images/index" do
  before(:each) do
    assign(:academy_tutorial_images, [
      stub_model(Academy::TutorialImage,
        :tutorial_id => 1,
        :url => "Url",
        :is_deleted => 2
      ),
      stub_model(Academy::TutorialImage,
        :tutorial_id => 1,
        :url => "Url",
        :is_deleted => 2
      )
    ])
  end

  it "renders a list of academy/tutorial_images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
