class Wash < ApplicationRecord
  belongs_to :wash_type
  belongs_to :washer
  belongs_to :vehicle
  belongs_to :receipt, optional: true
end
