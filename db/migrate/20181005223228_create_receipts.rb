class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.date :creation_date
      t.integer :informed_gross_amount
      t.integer :total_discount_amount
      t.string :sii_status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
