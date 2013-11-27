require 'spec_helper'

describe "votes/show" do
  before(:each) do
    @vote = assign(:vote, stub_model(Vote,
      :vote => 1,
      :user_id => 2,
      :answer_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
