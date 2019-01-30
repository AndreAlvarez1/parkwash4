class Vehicle < ApplicationRecord

  #RELATIONS WITH OTHER MODELS
  belongs_to :user
  belongs_to :place
  belongs_to :vehicle_size
  has_many :washes
  belongs_to :plan, optional: true


  #VALIDATIONS IN THIS MODEL
  validates :patent, presence: true, uniqueness: true
  validates :user_id, presence: true, numericality: true
  validates :vehicle_size_id, presence: true, numericality: true

end
