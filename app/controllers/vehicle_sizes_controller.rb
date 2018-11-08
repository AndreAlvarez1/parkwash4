class VehicleSizesController < ApplicationController
  before_action :set_vehicle_size, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_sizes
  # GET /vehicle_sizes.json
  def index
    @vehicle_sizes = VehicleSize.all
  end

  # GET /vehicle_sizes/1
  # GET /vehicle_sizes/1.json
  def show
  end

  # GET /vehicle_sizes/new
  def new
    @vehicle_size = VehicleSize.new
  end

  # GET /vehicle_sizes/1/edit
  def edit
  end

  # POST /vehicle_sizes
  # POST /vehicle_sizes.json
  def create
    @vehicle_size = VehicleSize.new(vehicle_size_params)

    respond_to do |format|
      if @vehicle_size.save
        format.html { redirect_to @vehicle_size, notice: 'Vehicle size was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_size }
      else
        format.html { render :new }
        format.json { render json: @vehicle_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_sizes/1
  # PATCH/PUT /vehicle_sizes/1.json
  def update
    respond_to do |format|
      if @vehicle_size.update(vehicle_size_params)
        format.html { redirect_to @vehicle_size, notice: 'Vehicle size was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_size }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_sizes/1
  # DELETE /vehicle_sizes/1.json
  def destroy
    @vehicle_size.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_sizes_url, notice: 'Vehicle size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_size
      @vehicle_size = VehicleSize.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_size_params
      params.require(:vehicle_size).permit(:code, :name, :description)
    end
end
