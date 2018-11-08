json.extract! vehicle, :id, :patent, :type, :brand, :model, :color, :status, :user_id, :vehicle_size_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
