class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.references :place, foreign_key: true
      t.references :wash_type, foreign_key: true
      t.references :vehicle_size, foreign_key: true
      t.integer :gross_amount

      t.timestamps
    end
  end
end
