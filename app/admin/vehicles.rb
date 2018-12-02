ActiveAdmin.register Vehicle do

  index do
    column :id
    column :patent
    column :vehicle_type
    column :brand
    column :model
    column :color
    column :vehicle_size do |vehicle|
      vehicle.vehicle_size.name
    end
    column :user do |vehicle|
      vehicle.user.first_name + " " + vehicle.user.last_name
    end
    actions
  end

end
