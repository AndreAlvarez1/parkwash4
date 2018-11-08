class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rut, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cellphone, :string
    add_column :users, :city, :string
    add_column :users, :birth_date, :date
    add_column :users, :card_status, :boolean
    add_column :users, :transdata_id, :string
    add_reference :users, :place, foreign_key: true
  end
end
