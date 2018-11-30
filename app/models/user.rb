class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  #RELATIONS WITH OTHER MODELS
  belongs_to :place
  has_many :vehicles, dependent: :delete_all
  has_many :washes, through: :vehicles
  has_many :receipts


  #VALIDATIONS IN THIS MODEL
  # Example that contains 4 basic validations:
  # validates :first_name, presence: false, uniqueness: false,  inclusion: {in: [1, 2, 3]}, numericality: false

  validates :email, presence: true, uniqueness: true
  # validates :rut, presence: true, uniqueness: true
  # validates :place, presence: true
  # validates :place, presence: true, inclusion: {in: [1, 2, 3]}, numericality: true

  # app/models/user.rb
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name
    end
  end

  def self.created_by_day
    group_by_day(:created_at).count
  end


end
