class Place < ApplicationRecord
  has_many :vehicles, dependent: :delete_all

  # enum name: ["Lugar No Determinado", "Demaría - Quilicura"]
end
