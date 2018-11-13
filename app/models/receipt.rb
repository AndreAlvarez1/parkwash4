class Receipt < ApplicationRecord
  belongs_to :user
  has_many :reconciliations
  has_many :payments, through: :reconciliations

  #VALIDATIONS IN THIS MODEL
  validates :informed_gross_amount, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true


end
