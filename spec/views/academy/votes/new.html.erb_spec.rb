require 'spec_helper'

describe "academy/votes/new" do
  before(:each) do
    assign(:academy_vote, stub_model(Academy::Vote,
      :vote => 1,
      :user_id => 1,
      :answer_id => 1
    ).as_new_record)
  end

  it "renders new academy_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_votes_path, "post" do
      assert_select "input#academy_vote_vote[name=?]", "academy_vote[vote]"
      assert_select "input#academy_vote_user_id[name=?]", "academy_vote[user_id]"
      assert_select "input#academy_vote_answer_id[name=?]", "academy_vote[answer_id]"
    end
  end
end
