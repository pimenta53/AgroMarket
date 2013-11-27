require 'spec_helper'

describe "academy/answers/new" do
  before(:each) do
    assign(:academy_answer, stub_model(Academy::Answer,
      :question_id => 1,
      :user_id => 1,
      :up => 1,
      :down => 1,
      :is_deleted => 1,
      :image_url => "MyString",
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new academy_answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_answers_path, "post" do
      assert_select "input#academy_answer_question_id[name=?]", "academy_answer[question_id]"
      assert_select "input#academy_answer_user_id[name=?]", "academy_answer[user_id]"
      assert_select "input#academy_answer_up[name=?]", "academy_answer[up]"
      assert_select "input#academy_answer_down[name=?]", "academy_answer[down]"
      assert_select "input#academy_answer_is_deleted[name=?]", "academy_answer[is_deleted]"
      assert_select "input#academy_answer_image_url[name=?]", "academy_answer[image_url]"
      assert_select "input#academy_answer_text[name=?]", "academy_answer[text]"
    end
  end
end
