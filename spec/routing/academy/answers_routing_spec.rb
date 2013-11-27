require "spec_helper"

describe Academy::AnswersController do
  describe "routing" do

    it "routes to #index" do
      get("/academy/answers").should route_to("academy/answers#index")
    end

    it "routes to #new" do
      get("/academy/answers/new").should route_to("academy/answers#new")
    end

    it "routes to #show" do
      get("/academy/answers/1").should route_to("academy/answers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/academy/answers/1/edit").should route_to("academy/answers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/academy/answers").should route_to("academy/answers#create")
    end

    it "routes to #update" do
      put("/academy/answers/1").should route_to("academy/answers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/academy/answers/1").should route_to("academy/answers#destroy", :id => "1")
    end

  end
end
