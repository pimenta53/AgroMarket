require 'spec_helper'

describe "academy/votes/edit" do
  before(:each) do
    @academy_vote = assign(:academy_vote, stub_model(Academy::Vote,
      :vote => 1,
      :user_id => 1,
      :answer_id => 1
    ))
  end

  it "renders the edit academy_vote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", academy_vote_path(@academy_vote), "post" do
      assert_select "input#academy_vote_vote[name=?]", "academy_vote[vote]"
      assert_select "input#academy_vote_user_id[name=?]", "academy_vote[user_id]"
      assert_select "input#academy_vote_answer_id[name=?]", "academy_vote[answer_id]"
    end
  end
end
