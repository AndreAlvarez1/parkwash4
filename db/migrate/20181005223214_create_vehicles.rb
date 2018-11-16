class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :patent
      t.string :type
      t.string :brand
      t.string :model
      t.string :color
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :vehicle_size, foreign_key: true

      t.timestamps
    end
  end
end
