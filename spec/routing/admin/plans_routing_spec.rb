require "spec_helper"

describe Admin::PlansController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/plans").should route_to("admin/plans#index")
    end

    it "routes to #new" do
      get("/admin/plans/new").should route_to("admin/plans#new")
    end

    it "routes to #show" do
      get("/admin/plans/1").should route_to("admin/plans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/plans/1/edit").should route_to("admin/plans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/plans").should route_to("admin/plans#create")
    end

    it "routes to #update" do
      put("/admin/plans/1").should route_to("admin/plans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/plans/1").should route_to("admin/plans#destroy", :id => "1")
    end

  end
end
