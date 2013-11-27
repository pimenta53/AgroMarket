require 'spec_helper'

describe "academy/questions/new" do
  before(:each) do
    assign(:academy_question, stub_model(Academy::Question,
      :user_id => 1,
      :category_id => 1,
      :title => "MyString",
      :text => "MyString",
      :is_deleted => 1,
      :image_url => "MyString"
    ).as_new_record)
  end

  it "renders new academy_question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_questions_path, "post" do
      assert_select "input#academy_question_user_id[name=?]", "academy_question[user_id]"
      assert_select "input#academy_question_category_id[name=?]", "academy_question[category_id]"
      assert_select "input#academy_question_title[name=?]", "academy_question[title]"
      assert_select "input#academy_question_text[name=?]", "academy_question[text]"
      assert_select "input#academy_question_is_deleted[name=?]", "academy_question[is_deleted]"
      assert_select "input#academy_question_image_url[name=?]", "academy_question[image_url]"
    end
  end
end
