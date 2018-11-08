class WashersController < ApplicationController

  def index
    @washer = current_washer
    @washers = Washer.all
  end

  def show
    @washer = current_washer
  end
end
