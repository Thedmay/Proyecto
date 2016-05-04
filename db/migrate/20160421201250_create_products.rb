class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :nombre
      t.string :codigo
      t.float :unidades
      t.float :cantidad
      t.string :medida
      t.date :fecha_produce
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
