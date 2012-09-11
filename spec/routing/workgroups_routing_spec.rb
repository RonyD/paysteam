require "spec_helper"

describe WorkgroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/workgroups").should route_to("workgroups#index")
    end

    it "routes to #new" do
      get("/workgroups/new").should route_to("workgroups#new")
    end

    it "routes to #show" do
      get("/workgroups/1").should route_to("workgroups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/workgroups/1/edit").should route_to("workgroups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/workgroups").should route_to("workgroups#create")
    end

    it "routes to #update" do
      put("/workgroups/1").should route_to("workgroups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/workgroups/1").should route_to("workgroups#destroy", :id => "1")
    end

  end
end
