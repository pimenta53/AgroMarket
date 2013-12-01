require "spec_helper"

describe Academy::WorkshopRegistrationsController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/workshop_registrations").should route_to("academy/workshop_registrations#index")
    end

    it "routes to #new" do
      get("/academy/workshop_registrations/new").should route_to("academy/workshop_registrations#new")
    end

    it "routes to #show" do
      get("/academy/workshop_registrations/1").should route_to("academy/workshop_registrations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/workshop_registrations/1/edit").should route_to("academy/workshop_registrations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/workshop_registrations").should route_to("academy/workshop_registrations#create")
    end

    it "routes to #update" do
      put("/academy/workshop_registrations/1").should route_to("academy/workshop_registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/workshop_registrations/1").should route_to("academy/workshop_registrations#destroy", :id => "1")
    end

  end
end
