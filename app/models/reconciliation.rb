class Reconciliation < ApplicationRecord
  belongs_to :payment
  belongs_to :receipt
end
