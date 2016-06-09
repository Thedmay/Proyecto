class CreateBillProducts < ActiveRecord::Migration
  def change
    create_table :bill_products do |t|
      t.references :bill, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
