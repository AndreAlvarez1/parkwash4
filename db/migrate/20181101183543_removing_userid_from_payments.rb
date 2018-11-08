class RemovingUseridFromPayments < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :user_id
  end
end
