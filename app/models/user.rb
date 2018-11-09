class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :place
  has_many :vehicles, dependent: :delete_all
  has_many :washes, through: :vehicles
  has_many :receipts
end
