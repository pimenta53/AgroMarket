require "spec_helper"

describe Academy::TutorialImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/tutorial_images").should route_to("academy/tutorial_images#index")
    end

    it "routes to #new" do
      get("/academy/tutorial_images/new").should route_to("academy/tutorial_images#new")
    end

    it "routes to #show" do
      get("/academy/tutorial_images/1").should route_to("academy/tutorial_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/tutorial_images/1/edit").should route_to("academy/tutorial_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/tutorial_images").should route_to("academy/tutorial_images#create")
    end

    it "routes to #update" do
      put("/academy/tutorial_images/1").should route_to("academy/tutorial_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/tutorial_images/1").should route_to("academy/tutorial_images#destroy", :id => "1")
    end

  end
end
