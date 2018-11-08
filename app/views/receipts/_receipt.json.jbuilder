json.extract! receipt, :id, :creation_date, :informed_gross_amount, :total_discount_amount, :sii_status, :user_id, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
