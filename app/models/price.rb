class Price < ApplicationRecord
  belongs_to :place
  belongs_to :wash_type
  belongs_to :vehicle_size
end
