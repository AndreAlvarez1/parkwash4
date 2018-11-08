class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :bank
      t.date :statement_date
      t.string :document_number
      t.string :description
      t.integer :received_amount
      t.integer :commission
      t.string :comissioner
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
