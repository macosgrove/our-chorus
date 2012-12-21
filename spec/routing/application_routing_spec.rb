require "spec_helper"

describe ApplicationController do
  describe "routing" do
    it "routes to #our_values" do
       get("/users").should route_to("users#index")
     end

  end
end