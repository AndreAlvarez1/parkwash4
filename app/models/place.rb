class Place < ApplicationRecord
  has_many :vehicles, dependent: :delete_all
end
