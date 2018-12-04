class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  # NOT WORKING! UNDERSTAND WHY.
  private
  def full_name
    "#{this.first_name} #{this.last_name}"
  end
end
