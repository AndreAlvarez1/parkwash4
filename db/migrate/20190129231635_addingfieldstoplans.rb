class Addingfieldstoplans < ActiveRecord::Migration[5.2]
  def change

    add_reference :plans, :user, index: true
    add_foreign_key :plans, :users
    add_reference :plans, :vehicle, index: true
    add_foreign_key :plans, :vehicles

  end
end
