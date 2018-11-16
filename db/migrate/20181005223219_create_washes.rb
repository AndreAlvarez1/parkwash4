class CreateWashes < ActiveRecord::Migration[5.2]
  def change
    create_table :washes do |t|
      t.date :creation_date
      t.integer :discount_amount
      t.references :wash_type, foreign_key: true
      t.references :washer, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
