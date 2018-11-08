json.extract! payment, :id, :bank, :statement_date, :document_number, :description, :received_amount, :commission, :comissioner, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
