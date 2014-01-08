require "spec_helper"

describe Admin::CitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/cities").should route_to("admin/cities#index")
    end

    it "routes to #new" do
      get("/admin/cities/new").should route_to("admin/cities#new")
    end

    it "routes to #show" do
      get("/admin/cities/1").should route_to("admin/cities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/cities/1/edit").should route_to("admin/cities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/cities").should route_to("admin/cities#create")
    end

    it "routes to #update" do
      put("/admin/cities/1").should route_to("admin/cities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/cities/1").should route_to("admin/cities#destroy", :id => "1")
    end

  end
end
