require 'spec_helper'

describe "Admin::Academy::Workshops" do
  describe "GET /admin_academy_workshops" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_academy_workshops_path
      response.status.should be(200)
    end
  end
end
