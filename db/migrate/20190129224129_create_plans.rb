class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :type
      t.string :frequency
      t.integer :price

      t.timestamps
    end
  end
end
