class Plan < ApplicationRecord

  #RELATIONS WITH OTHER MODELS
  belongs_to :user
  belongs_to :wash_type
  has_many :vehicles
end
