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
    @plan.wash_type_id = params[:plan][:wash_type_id]
    @vehicles_ids_chosen = params[:plan][:vehicles_chosen]
    @vehicles_array = []
    @vehicles_ids_chosen.each do |veh_id|
      @vehicles_array << Vehicle.find(veh_id.to_i)
    end

    @plan.save

    @vehicles_array.each do |vehicle|
      vehicle.plan_id = @plan.id
      vehicle.save
    end

    # debugger



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
      params.require(:plan).permit(:wash_type, :frequency)
    end
end
