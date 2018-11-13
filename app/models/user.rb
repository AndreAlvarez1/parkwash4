class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #RELATIONS WITH OTHER MODELS
  belongs_to :place
  has_many :vehicles, dependent: :delete_all
  has_many :washes, through: :vehicles
  has_many :receipts


  #VALIDATIONS IN THIS MODEL
  # Example that contains 4 basic validations:
  # validates :first_name, presence: false, uniqueness: false,  inclusion: {in: [1, 2, 3]}, numericality: false

  validates :email, presence: true, uniqueness: true
  validates :rut, presence: true, uniqueness: true
  validates :place_id, presence: true, inclusion: {in: [1, 2, 3]}, numericality: true

end
