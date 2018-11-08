class Vehicle < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle_size
  has_many :washes
end
