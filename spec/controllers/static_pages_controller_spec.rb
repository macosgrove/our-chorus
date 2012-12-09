require 'spec_helper'

describe StaticPagesController do

  describe "GET 'our_vision'" do
    it "returns http success" do
      get 'our_vision'
      response.should be_success
    end
  end

  describe "GET 'our_values'" do
    it "returns http success" do
      get 'our_values'
      response.should be_success
    end
  end

  describe "GET 'our_music'" do
    it "returns http success" do
      get 'our_music'
      response.should be_success
    end
  end

end
