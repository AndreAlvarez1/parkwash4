class Changesonpaymenttable < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :bank
    remove_column :payments, :statement_date
    remove_column :payments, :document_number
    remove_column :payments, :description
    remove_column :payments, :received_amount
    remove_column :payments, :commission
    remove_column :payments, :commissioner

    add_column :payments, :charged_date, :date
    add_column :payments, :method, :string
    add_column :payments, :paid_amount, :integer
    add_column :payments, :description, :string


    add_reference :payments, :user, index: true
    add_foreign_key :payments, :users
    add_reference :payments, :receipt, index: true
    add_foreign_key :payments, :users

  end
end
