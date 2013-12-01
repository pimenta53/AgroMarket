require 'spec_helper'

describe "academy/tutorials/edit" do
  before(:each) do
    @academy_tutorial = assign(:academy_tutorial, stub_model(Academy::Tutorial,
      :category_id => 1,
      :user_id => 1,
      :aproved => 1,
      :title => "MyString",
      :text => "MyString",
      :is_delected => 1
    ))
  end

  it "renders the edit academy_tutorial form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_tutorial_path(@academy_tutorial), "post" do
      assert_select "input#academy_tutorial_category_id[name=?]", "academy_tutorial[category_id]"
      assert_select "input#academy_tutorial_user_id[name=?]", "academy_tutorial[user_id]"
      assert_select "input#academy_tutorial_aproved[name=?]", "academy_tutorial[aproved]"
      assert_select "input#academy_tutorial_title[name=?]", "academy_tutorial[title]"
      assert_select "input#academy_tutorial_text[name=?]", "academy_tutorial[text]"
      assert_select "input#academy_tutorial_is_delected[name=?]", "academy_tutorial[is_delected]"
    end
  end
end
