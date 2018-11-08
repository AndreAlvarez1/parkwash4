class CreateCreditNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_notes do |t|
      t.date :creation_date
      t.integer :informed_gross_amount
      t.string :sii_status
      t.references :receipt, foreign_key: true

      t.timestamps
    end
  end
end
