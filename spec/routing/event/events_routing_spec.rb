require "spec_helper"

describe Event::EventsController do
  describe "routing" do

    it "routes to #index" do
      get("/event/events").should route_to("event/events#index")
    end

    it "routes to #new" do
      get("/event/events/new").should route_to("event/events#new")
    end

    it "routes to #show" do
      get("/event/events/1").should route_to("event/events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event/events/1/edit").should route_to("event/events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event/events").should route_to("event/events#create")
    end

    it "routes to #update" do
      put("/event/events/1").should route_to("event/events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event/events/1").should route_to("event/events#destroy", :id => "1")
    end

  end
end
