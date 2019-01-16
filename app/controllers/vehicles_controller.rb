class VehiclesController < ApplicationController
  # load_and_authorize_resource
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
    @user = current_user
    @places = Place.all
  end

  def index_all
    @vehicles = Vehicle.all
    @vehicle = Vehicle.new
    @user = current_user
  end
  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    @places = Place.all
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    # debugger
    @vehicle = Vehicle.create(vehicle_params)
    @vehicle.user_id = current_user.id
    @vehicle.vehicle_size = VehicleSize.first
    # render json: @vehicle.as_json
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to user_vehicles_path, notice: 'Vehicle was successfully created.' }
        # format.js
        format.json { render @vehicle, status: :created}
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicles_index_all_path, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to user_vehicles_path, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:patent, :vehicle_type, :brand, :model,
        :color, :status, :user_id, :vehicle_size_id, :place_id)
    end
end
