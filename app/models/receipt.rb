class Receipt < ApplicationRecord
  belongs_to :user
  has_many :reconciliations
  has_many :payments, through: :reconciliations
end
