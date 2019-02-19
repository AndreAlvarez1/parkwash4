class PlansController < InheritedResources::Base

  before_action :delete_empty_plans, only: [:create, :update]


  def index
    @user = current_user
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
    @user = current_user
    @user_vehicles = @user.vehicles
    @all_wash_types = WashType.all
  end

  def create

    if current_user.plans.count < 3
      @plan = Plan.create(plan_params)
    else
      respond_to do |format|
        format.html { redirect_to user_plans_path, alert: 'La suscripción no fue creada. Sólo puedes crear 3 como máximo' }
      end
      return
    end

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

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to user_plans_path, notice: 'La suscripción fue borrada con éxito.' }
      format.json { head :no_content }
    end
  end

  private

    def plan_params
      params.require(:plan).permit(:wash_type, :frequency)
    end

    def delete_empty_plans
      @all_plans = Plan.all
      @all_plans.each do |plan|
        if plan.vehicles.count == 0
          plan.destroy
        end
      end
    end
end
