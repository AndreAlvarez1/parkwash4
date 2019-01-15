class Convertplacenametoenum < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :name
    add_column :places, :name, :integer
  end
end
