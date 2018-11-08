class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def index_washers
    @washer = current_washer
  end

end
