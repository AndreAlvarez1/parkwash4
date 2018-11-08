class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :commune
      t.string :city
      t.string :contact_name
      t.string :contact_cellphone
      t.string :contact_email

      t.timestamps
    end
  end
end
