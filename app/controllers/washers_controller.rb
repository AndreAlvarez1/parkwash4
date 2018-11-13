class WashersController < ApplicationController
  load_and_authorize_resource

  def index
    @washer = current_washer
    @washers = Washer.all
  end

  def show
    @washer = current_washer
  end
end
