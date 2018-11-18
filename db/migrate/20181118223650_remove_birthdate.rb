class RemoveBirthdate < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birth_date
    remove_column :washers, :birth_date
  end
end
