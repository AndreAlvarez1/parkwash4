class Vehicle < ApplicationRecord

  #RELATIONS WITH OTHER MODELS
  belongs_to :user
  belongs_to :place
  belongs_to :vehicle_size
  has_many :washes

  #VALIDATIONS IN THIS MODEL
  validates :patent, presence: true, uniqueness: true
  validates :user_id, presence: true, numericality: true
  validates :vehicle_size_id, presence: true, numericality: true

end
