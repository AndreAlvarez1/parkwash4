class AddColumnsToWashers < ActiveRecord::Migration[5.2]
  def change
    add_column :washers, :rut, :string
    add_column :washers, :first_name, :string
    add_column :washers, :last_name, :string
    add_column :washers, :cellphone, :string
    add_column :washers, :city, :string
    add_column :washers, :birth_date, :date
    add_column :washers, :role, :integer
  end
end
