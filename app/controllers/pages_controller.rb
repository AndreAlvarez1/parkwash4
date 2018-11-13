class PagesController < ApplicationController
  # load_and_authorize_resource
  def index
    @user = current_user
  end

  def index_washers
    @washer = current_washer
  end

end
