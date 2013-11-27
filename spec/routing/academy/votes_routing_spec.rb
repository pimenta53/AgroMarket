require "spec_helper"

describe Academy::VotesController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/votes").should route_to("academy/votes#index")
    end

    it "routes to #new" do
      get("/academy/votes/new").should route_to("academy/votes#new")
    end

    it "routes to #show" do
      get("/academy/votes/1").should route_to("academy/votes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/votes/1/edit").should route_to("academy/votes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/votes").should route_to("academy/votes#create")
    end

    it "routes to #update" do
      put("/academy/votes/1").should route_to("academy/votes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/votes/1").should route_to("academy/votes#destroy", :id => "1")
    end

  end
end
