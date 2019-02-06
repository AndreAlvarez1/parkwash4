class Vehicle < ApplicationRecord

  #RELATIONS WITH OTHER MODELS
  belongs_to :user
  belongs_to :place
  belongs_to :vehicle_size
  has_many :washes
  belongs_to :plan, optional: true


  #VALIDATIONS (Typical) IN THIS MODEL
  validates :patent, presence: true, uniqueness: true
  validates :user_id, presence: true, numericality: true
  validates :vehicle_size_id, presence: true, numericality: true

  # VALIDATIONS (New) - Traté de hacerlo aquí pero no supe como (06-02-2019),
  # Retormalo más adelante
  # validate :check_quantity_restriction?, :on => :create
  # before_action :check_quantity_restriction?, only: [:create]

  # def check_quantity_restriction?
  #   if self.user.vehicles.count >= 3
  #     errors.add(:base, "Exceeded Vehicle limit")
  #     return false
  #   end
  #   # debugger
  # end


end
