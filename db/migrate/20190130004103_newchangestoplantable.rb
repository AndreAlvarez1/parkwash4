class Newchangestoplantable < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :type

    add_reference :plans, :wash_type, index: true
    add_foreign_key :plans, :wash_type

  end
end
