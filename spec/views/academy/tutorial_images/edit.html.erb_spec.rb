require 'spec_helper'

describe "academy/tutorial_images/edit" do
  before(:each) do
    @academy_tutorial_image = assign(:academy_tutorial_image, stub_model(Academy::TutorialImage,
      :tutorial_id => 1,
      :url => "MyString",
      :is_deleted => 1
    ))
  end

  it "renders the edit academy_tutorial_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_tutorial_image_path(@academy_tutorial_image), "post" do
      assert_select "input#academy_tutorial_image_tutorial_id[name=?]", "academy_tutorial_image[tutorial_id]"
      assert_select "input#academy_tutorial_image_url[name=?]", "academy_tutorial_image[url]"
      assert_select "input#academy_tutorial_image_is_deleted[name=?]", "academy_tutorial_image[is_deleted]"
    end
  end
end
