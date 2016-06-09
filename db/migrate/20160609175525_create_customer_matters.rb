class CreateCustomerMatters < ActiveRecord::Migration
  def change
    create_table :customer_matters do |t|
      t.references :customer, index: true, foreign_key: true
      t.references :matter, index: true, foreign_key: true
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
