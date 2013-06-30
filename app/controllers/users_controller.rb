class UsersController < ApplicationController

  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all.to_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/list
  # GET /users/list.json
  def list
    @users = User.all.to_a

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Member was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        flash.now[:error] = @user.errors.full_messages
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.find(params[:id])

    respond_to do |format|
      non_assignable_roles = @user.non_assignable_roles
      retain_non_assignable_roles(params[:user])
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def retain_non_assignable_roles user_param
    if user_param['role_ids']
      @user.non_assignable_roles.map{|role| role.id}.each do
        |non_assignable|
        user_param['role_ids'].push(non_assignable)
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
