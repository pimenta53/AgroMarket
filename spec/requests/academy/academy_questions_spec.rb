require 'spec_helper'

describe "Academy::Questions" do
  describe "GET /academy_questions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get academy_questions_path
      response.status.should be(200)
    end
  end
end
