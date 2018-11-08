class CreateReconciliations < ActiveRecord::Migration[5.2]
  def change
    create_table :reconciliations do |t|
      t.references :payment, foreign_key: true
      t.references :receipt, foreign_key: true
      t.integer :amount_assigned_from_payment_to_receipt

      t.timestamps
    end
  end
end
