json.extract! card, :id, :user_id, :number, :active, :erased, :created_at, :updated_at
json.url card_url(card, format: :json)
