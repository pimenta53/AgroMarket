require "spec_helper"

describe Academy::TutorialsController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/tutorials").should route_to("academy/tutorials#index")
    end

    it "routes to #new" do
      get("/academy/tutorials/new").should route_to("academy/tutorials#new")
    end

    it "routes to #show" do
      get("/academy/tutorials/1").should route_to("academy/tutorials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/tutorials/1/edit").should route_to("academy/tutorials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/tutorials").should route_to("academy/tutorials#create")
    end

    it "routes to #update" do
      put("/academy/tutorials/1").should route_to("academy/tutorials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/tutorials/1").should route_to("academy/tutorials#destroy", :id => "1")
    end

  end
end
