require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users").should route_to("users#index")
    end

    it "routes to registrations#new" do
      get("/users/sign_up").should route_to("devise/registrations#new")
    end

    it "routes to sessions#new" do
      get("/users/sign_in").should route_to("devise/sessions#new")
    end

    it "routes to sessions#destroy" do
      delete("/users/sign_out").should route_to("devise/sessions#destroy")
    end

    it "routes to #show" do
      get("/users/1").should route_to("users#show", :id => "1")
    end

    it "routes to #edit" do
      pending "fix devise routing"
      get("/users/1/edit").should route_to("devise/registrations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/users").should route_to("devise/registrations#create")
    end

    it "routes to #update" do
      pending "fix devise routing"
      put("/users/1").should route_to("devise/registrations#update", :id => "1")
    end

    it "routes to #destroy" do
      pending "fix devise routing"
      delete("/users/1").should route_to("devise/registrations#destroy", :id => "1")
    end

  end
end
