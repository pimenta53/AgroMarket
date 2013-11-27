require 'spec_helper'

describe "Academy::WorkshopRegistrations" do
  describe "GET /academy_workshop_registrations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get academy_workshop_registrations_path
      response.status.should be(200)
    end
  end
end
