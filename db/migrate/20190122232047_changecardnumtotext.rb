class Changecardnumtotext < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :number
    add_column :cards, :number, :string
  end
end
