require "spec_helper"

describe AcaDataController do
  describe "routing" do

    it "routes to #index" do
      get("/aca_data").should route_to("aca_data#index")
    end

    it "routes to #new" do
      get("/aca_data/new").should route_to("aca_data#new")
    end

    it "routes to #show" do
      get("/aca_data/1").should route_to("aca_data#show", :id => "1")
    end

    it "routes to #edit" do
      get("/aca_data/1/edit").should route_to("aca_data#edit", :id => "1")
    end

    it "routes to #create" do
      post("/aca_data").should route_to("aca_data#create")
    end

    it "routes to #update" do
      put("/aca_data/1").should route_to("aca_data#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/aca_data/1").should route_to("aca_data#destroy", :id => "1")
    end

  end
end
