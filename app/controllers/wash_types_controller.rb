class WashTypesController < ApplicationController
  before_action :set_wash_type, only: [:show, :edit, :update, :destroy]

  # GET /wash_types
  # GET /wash_types.json
  def index
    @wash_types = WashType.all
  end

  # GET /wash_types/1
  # GET /wash_types/1.json
  def show
  end

  # GET /wash_types/new
  def new
    @wash_type = WashType.new
  end

  # GET /wash_types/1/edit
  def edit
  end

  # POST /wash_types
  # POST /wash_types.json
  def create
    @wash_type = WashType.new(wash_type_params)

    respond_to do |format|
      if @wash_type.save
        format.html { redirect_to @wash_type, notice: 'Wash type was successfully created.' }
        format.json { render :show, status: :created, location: @wash_type }
      else
        format.html { render :new }
        format.json { render json: @wash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wash_types/1
  # PATCH/PUT /wash_types/1.json
  def update
    respond_to do |format|
      if @wash_type.update(wash_type_params)
        format.html { redirect_to @wash_type, notice: 'Wash type was successfully updated.' }
        format.json { render :show, status: :ok, location: @wash_type }
      else
        format.html { render :edit }
        format.json { render json: @wash_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wash_types/1
  # DELETE /wash_types/1.json
  def destroy
    @wash_type.destroy
    respond_to do |format|
      format.html { redirect_to wash_types_url, notice: 'Wash type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wash_type
      @wash_type = WashType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wash_type_params
      params.require(:wash_type).permit(:code, :name, :description)
    end
end
