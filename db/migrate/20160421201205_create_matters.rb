class CreateMatters < ActiveRecord::Migration
  def change
    create_table :matters do |t|
      t.string :nombre
      t.float :cantidad
      t.string :medida
      t.float :saldo
      t.date :fecha_ingreso
      t.date :fecha_utiliza

      t.timestamps null: false
    end
  end
end
