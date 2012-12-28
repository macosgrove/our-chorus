require 'spec_helper'

describe UsersController do

  context "A guest is viewing" do

    before :each do
      sign_in nil
    end

    describe "GET index" do
      it "should deny access" do
        get :index, {}
        response.should redirect_to(root_url)
      end
    end

    describe "GET show" do
      it "should deny access" do
        user = FactoryGirl.create(:full_member)
        get :show, {:id => user.to_param}
        response.should redirect_to(root_url)
      end
    end
  end

  context "A member is logged in" do

    before :each do
      sign_in FactoryGirl.create(:founder, username: 'loggedinuser')
    end

    describe "GET index" do
      it "should not deny access" do
        get :index, {}
        response.should render_template("users/index")
      end

      it "assigns all users as @users" do
        FactoryGirl.create(:user, username: 'example')
        get :index, {}
        # macosgrove (founder) and dev (developer) are seeds
        assigns(:users).first.username.should eq 'macosgrove'
        assigns(:users).second.username.should eq 'dev'
        assigns(:users).third.username.should eq 'loggedinuser'
        assigns(:users).fourth.username.should eq 'example'
      end
    end

    describe "GET show" do
      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user)
        get :show, {:id => user.to_param}
        assigns(:user).should eq(user)
      end
    end
  end
end
