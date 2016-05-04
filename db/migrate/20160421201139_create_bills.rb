class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :numero
      t.date :fecha
      t.string :razon_social
      t.string :giro_comercial
      t.float :monto_neto
      t.float :iva
      t.float :total
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
