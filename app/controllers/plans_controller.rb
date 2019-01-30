class PlansController < InheritedResources::Base


  def index
    @plans = Plan.all
    @user = current_user
  end

  def new
    @plan = Plan.new
    @user = current_user
    @user_vehicles = @user.vehicles
    @all_wash_types = WashType.all
  end

  def create
    @plan = Plan.create(plan_params)
    @user = current_user
    @user_vehicles = @user.vehicles
    @all_wash_types = WashType.all
    @plan.user_id = current_user.id
    # render json: @plan.as_json
    respond_to do |format|
      if @plan.save
        format.html { redirect_to user_plans_path, notice: 'El fue exitosamente creado.' }
        # format.js
        format.json { render @plan, status: :created}
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def plan_params
      params.require(:plan).permit(:code, :name, :description, :type_wash, :frequency, :price)
    end
end
