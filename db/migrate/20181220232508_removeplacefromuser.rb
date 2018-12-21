class Removeplacefromuser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :place_id
    remove_foreign_key :users, column: :place_id
    add_column :vehicles, :place_id, :integer
    add_foreign_key :vehicles, column: :place_id
  end
end
