class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.integer :number
      t.boolean :active
      t.boolean :erased

      t.timestamps
    end
  end
end
