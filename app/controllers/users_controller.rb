class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

end
