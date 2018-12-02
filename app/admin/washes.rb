ActiveAdmin.register Wash do

  index do
    column :id
    column :patent do |wash|
      wash.vehicle.patent
    end
    column :user do |wash|
      wash.vehicle.user.first_name + " " + wash.vehicle.user.last_name
    end
    actions
  end

end
