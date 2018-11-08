class CreateVehicleSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicle_sizes do |t|
      t.string :code
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
