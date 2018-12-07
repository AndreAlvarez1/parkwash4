ActiveAdmin.register Wash do

  index do
    column :id
    column :wash_type do |wash|
      wash.wash_type.name
    end
    column :patent do |wash|
      wash.vehicle.patent
    end
    column :patent do |wash|
      wash.vehicle.vehicle_type
    end
    column :patent do |wash|
      wash.vehicle.brand
    end
    column :patent do |wash|
      wash.vehicle.model
    end
    column :user do |wash|
      wash.vehicle.user.first_name + " " + wash.vehicle.user.last_name
    end
    actions
  end

end
