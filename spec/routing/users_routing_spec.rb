require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #index" do
      get("/users").should route_to("users#index")
    end

    it "routes to registrations#new" do
      get("/my/users/sign_up").should route_to("registrations#new")
    end

    it "routes to sessions#new" do
      get("/my/users/sign_in").should route_to("devise/sessions#new")
    end

    it "routes to sessions#destroy" do
      delete("/my/users/sign_out").should route_to("devise/sessions#destroy")
    end

    it "routes to #show" do
      get("/users/1").should route_to("users#show", :id => "1")
    end

    it "routes to registrations#edit" do
      get("/my/users/edit").should route_to("registrations#edit")
    end

    it "routes to registrations#welcome" do
      get("/welcome").should route_to("registrations#welcome")
    end

    it "routes to #edit" do
      get("/users/1/edit").should route_to("users#edit", :id => "1")
    end

    it "routes to registrations#create" do
      post("/my/users").should route_to("registrations#create")
    end

    it "routes to #create" do
      post("/users").should route_to("users#create")
    end

    it "routes to #update" do
      put("/users/1").should route_to("users#update", :id => "1")
    end

    it "routes to registrations#update" do
      put("/my/users").should route_to("registrations#update")
    end

    it "routes to registrations#destroy" do
      delete("/my/users").should route_to("registrations#destroy")
    end

    it "routes to #destroy" do
      delete("/users/1").should route_to("users#destroy", :id => "1")
    end

  end
end
