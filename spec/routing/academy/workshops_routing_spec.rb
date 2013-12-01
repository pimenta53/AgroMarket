require "spec_helper"

describe Academy::WorkshopsController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/workshops").should route_to("academy/workshops#index")
    end

    it "routes to #new" do
      get("/academy/workshops/new").should route_to("academy/workshops#new")
    end

    it "routes to #show" do
      get("/academy/workshops/1").should route_to("academy/workshops#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/workshops/1/edit").should route_to("academy/workshops#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/workshops").should route_to("academy/workshops#create")
    end

    it "routes to #update" do
      put("/academy/workshops/1").should route_to("academy/workshops#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/workshops/1").should route_to("academy/workshops#destroy", :id => "1")
    end

  end
end
