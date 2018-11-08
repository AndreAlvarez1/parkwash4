class Payment < ApplicationRecord
  has_many :reconciliations
  has_many :receipts, through: :reconciliations
end
