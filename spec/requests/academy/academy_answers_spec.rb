require 'spec_helper'

describe "Academy::Answers" do
  describe "GET /academy_answers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get academy_answers_path
      response.status.should be(200)
    end
  end
end
