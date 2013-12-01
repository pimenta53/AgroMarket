require 'spec_helper'

describe "academy/votes/index" do
  before(:each) do
    assign(:academy_votes, [
      stub_model(Academy::Vote,
        :vote => 1,
        :user_id => 2,
        :answer_id => 3
      ),
      stub_model(Academy::Vote,
        :vote => 1,
        :user_id => 2,
        :answer_id => 3
      )
    ])
  end

  it "renders a list of academy/votes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
