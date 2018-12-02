class WashesController < ApplicationController
  before_action :set_wash, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource
  # skip_authorization_check :only => [:new, :create]

  # GET /washes
  # GET /washes.json
  def index
    @washes = Wash.all
    @user = current_user
    @show_by_patent = false
    if params[:vehicle_patent].present?
      @vehicle_patent = params[:vehicle_patent]
      @show_by_patent = true
    end


  end

  def index_all
    @washes = Wash.all
    @wash = Wash.new
    @washes =  if params[:search_q].present?
                Wash.where("id like ?", "%#{params[:search_q]}%")
              else
                Wash.all
              end
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @resource }
    end
  end

  # GET /washes/1
  # GET /washes/1.json
  def show
  end

  # GET /washes/new
  def new
    @wash = Wash.new
  end

  # GET /washes/1/edit
  def edit
  end

  # POST /washes
  # POST /washes.json
  def create
    @wash = Wash.new(wash_params)

    respond_to do |format|
      if @wash.save
        format.html { redirect_to @wash, notice: 'Wash was successfully created.' }
        format.js
        format.json { render :show, status: :created, location: @wash }
      else
        format.html { render :new }
        format.json { render json: @wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /washes/1
  # PATCH/PUT /washes/1.json
  def update
    respond_to do |format|
      if @wash.update(wash_params)
        format.html { redirect_to @wash, notice: 'Wash was successfully updated.' }
        format.json { render :show, status: :ok, location: @wash }
      else
        format.html { render :edit }
        format.json { render json: @wash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /washes/1
  # DELETE /washes/1.json
  def destroy
    @wash.destroy
    respond_to do |format|
      format.html { redirect_to washes_url, notice: 'Wash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wash
      @wash = Wash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wash_params
      params.require(:wash).permit(:creation_date, :discount_amount, :wash_type_id, :washer_id, :vehicle_id, :receipt_id)
    end
end
