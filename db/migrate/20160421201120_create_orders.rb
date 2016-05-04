class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :numero
      t.date :fecha
      t.string :detalle
      t.float :cantidad
      t.string :medida
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
