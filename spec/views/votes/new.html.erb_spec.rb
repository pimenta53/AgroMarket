require 'spec_helper'

describe "votes/new" do
  before(:each) do
    assign(:vote, stub_model(Vote,
      :vote => 1,
      :user_id => 1,
      :answer_id => 1
    ).as_new_record)
  end

  it "renders new vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", votes_path, "post" do
      assert_select "input#vote_vote[name=?]", "vote[vote]"
      assert_select "input#vote_user_id[name=?]", "vote[user_id]"
      assert_select "input#vote_answer_id[name=?]", "vote[answer_id]"
    end
  end
end
