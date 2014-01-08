require 'spec_helper'

describe "Plams" do
  describe "GET /plams" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get plams_path
      response.status.should be(200)
    end
  end
end
