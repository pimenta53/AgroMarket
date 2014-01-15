require "spec_helper"

describe Admin::Academy::WorkshopsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/academies").should route_to("admin/academies#index")
    end

    it "routes to #new" do
      get("/admin/academies/new").should route_to("admin/academies#new")
    end

    it "routes to #show" do
      get("/admin/academies/1").should route_to("admin/academies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/academies/1/edit").should route_to("admin/academies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/academies").should route_to("admin/academies#create")
    end

    it "routes to #update" do
      put("/admin/academies/1").should route_to("admin/academies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/academies/1").should route_to("admin/academies#destroy", :id => "1")
    end

  end
end
