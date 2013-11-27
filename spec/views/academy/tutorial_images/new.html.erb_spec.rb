require 'spec_helper'

describe "academy/tutorial_images/new" do
  before(:each) do
    assign(:academy_tutorial_image, stub_model(Academy::TutorialImage,
      :tutorial_id => 1,
      :url => "MyString",
      :is_deleted => 1
    ).as_new_record)
  end

  it "renders new academy_tutorial_image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_tutorial_images_path, "post" do
      assert_select "input#academy_tutorial_image_tutorial_id[name=?]", "academy_tutorial_image[tutorial_id]"
      assert_select "input#academy_tutorial_image_url[name=?]", "academy_tutorial_image[url]"
      assert_select "input#academy_tutorial_image_is_deleted[name=?]", "academy_tutorial_image[is_deleted]"
    end
  end
end
