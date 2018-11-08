class AddNewColumns < ActiveRecord::Migration[5.2]
  def change
      add_column :washes, :receipt_assigned_amount_to_wash, :integer
  end
end
