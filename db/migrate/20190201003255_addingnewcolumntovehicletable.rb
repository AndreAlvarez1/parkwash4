class Addingnewcolumntovehicletable < ActiveRecord::Migration[5.2]
  def change
    add_reference :vehicles, :plan, index: true
    add_foreign_key :vehicles, :plan
  end
end
