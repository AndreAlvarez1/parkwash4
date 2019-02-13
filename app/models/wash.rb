class Wash < ApplicationRecord
  #RELATIONS WITH OTHER TABLES
  belongs_to :wash_type
  belongs_to :washer
  belongs_to :vehicle
  belongs_to :receipt, optional: true

  #VALIDATIONS IN THIS MODEL
  validates :washer_id, presence: true, numericality: true
  validates :vehicle_id, presence: true, numericality: true

  def wash_price
    rand(55..100)*100
  end

end
