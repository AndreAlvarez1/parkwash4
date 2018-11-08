class ChangingColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :vehicles, :type, :vehicle_type
    rename_column :payments, :comissioner, :commissioner
  end
end
