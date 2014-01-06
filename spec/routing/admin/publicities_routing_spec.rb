require "spec_helper"

describe Admin::PublicitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/publicities").should route_to("admin/publicities#index")
    end

    it "routes to #new" do
      get("/admin/publicities/new").should route_to("admin/publicities#new")
    end

    it "routes to #show" do
      get("/admin/publicities/1").should route_to("admin/publicities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/publicities/1/edit").should route_to("admin/publicities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/publicities").should route_to("admin/publicities#create")
    end

    it "routes to #update" do
      put("/admin/publicities/1").should route_to("admin/publicities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/publicities/1").should route_to("admin/publicities#destroy", :id => "1")
    end

  end
end
