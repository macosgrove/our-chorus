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

    describe "GET list" do
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

  context "A provisional member is logged in" do

    before :each do
      sign_in FactoryGirl.create(:provisional, username: 'loggedinuser')
    end

    describe "GET index" do
      it "should deny access" do
        get :index, {}
        response.should redirect_to(root_url)
      end
    end

    describe "GET list" do
      it "should not deny access" do
        get :list, {}
        response.should render_template("users/list")
      end

      it "assigns all users as @users" do
        FactoryGirl.create(:user, username: 'example')
        get :list, {}
        # macosgrove (founder) and dev (developer) are seeds
        names = assigns(:users).collect {|user| user.username}
        verify_names_includes names, ['macosgrove', 'dev', 'loggedinuser', 'example']
      end
    end

    describe "GET show" do
      it "should deny access" do
        user = FactoryGirl.create(:user)
        get :show, {:id => user.to_param}
        response.should redirect_to(root_url)
      end
    end

    describe "GET edit" do
      it "should deny access" do
        user = FactoryGirl.create(:user)
        get :edit, {:id => user.to_param}
        response.should redirect_to(root_url)
      end
     end
  end

  context "A full member is logged in" do

    before :each do
      sign_in FactoryGirl.create(:full_member, username: 'loggedinuser')
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
        names = assigns(:users).collect {|user| user.username}
        verify_names_includes names, ['macosgrove', 'dev', 'loggedinuser', 'example']
      end
    end

    describe "GET list" do
      it "should not deny access" do
        get :list, {}
        response.should render_template("users/list")
      end

      it "assigns all users as @users" do
        FactoryGirl.create(:user, username: 'example')
        get :list, {}
        # macosgrove (founder) and dev (developer) are seeds
        names = assigns(:users).collect {|user| user.username}
        verify_names_includes names, ['macosgrove', 'dev', 'loggedinuser', 'example']
      end
    end

    describe "GET show" do
      it "assigns the requested user as @user" do
        user = FactoryGirl.create(:user)
        get :show, {:id => user.to_param}
        assigns(:user).should eq(user)
      end
    end

    describe "GET edit" do
      it "assigns the requested user as @resource" do
        user = FactoryGirl.create(:user)
        get :edit, {:id => user.to_param}
        assigns(:user).should eq(user)
      end
      it "renders the registration template" do
        user = FactoryGirl.create(:user)
        get :edit, {:id => user.to_param}
        response.should render_template("users/edit")
      end
    end
  end

  def verify_names_includes(actual_names, expected_names)
    expected_names.each { |name| actual_names.should include name }
  end


end
