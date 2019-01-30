json.extract! plan, :id, :code, :name, :description, :type, :frecuency, :price, :created_at, :updated_at
json.url plan_url(plan, format: :json)
