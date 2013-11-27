require 'spec_helper'

describe "votes/edit" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :vote => 1,
      :user_id => 1,
      :answer_id => 1
    ))
  end

  it "renders the edit vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do
      assert_select "input#vote_vote[name=?]", "vote[vote]"
      assert_select "input#vote_user_id[name=?]", "vote[user_id]"
      assert_select "input#vote_answer_id[name=?]", "vote[answer_id]"
    end
  end
end
