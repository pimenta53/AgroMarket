require "spec_helper"

describe Academy::QuestionsController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/questions").should route_to("academy/questions#index")
    end

    it "routes to #new" do
      get("/academy/questions/new").should route_to("academy/questions#new")
    end

    it "routes to #show" do
      get("/academy/questions/1").should route_to("academy/questions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/questions/1/edit").should route_to("academy/questions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/questions").should route_to("academy/questions#create")
    end

    it "routes to #update" do
      put("/academy/questions/1").should route_to("academy/questions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/questions/1").should route_to("academy/questions#destroy", :id => "1")
    end

  end
end
