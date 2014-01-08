require "spec_helper"

describe PlamsController do
  describe "routing" do

    it "routes to #index" do
      get("/plams").should route_to("plams#index")
    end

    it "routes to #new" do
      get("/plams/new").should route_to("plams#new")
    end

    it "routes to #show" do
      get("/plams/1").should route_to("plams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/plams/1/edit").should route_to("plams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/plams").should route_to("plams#create")
    end

    it "routes to #update" do
      put("/plams/1").should route_to("plams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/plams/1").should route_to("plams#destroy", :id => "1")
    end

  end
end
