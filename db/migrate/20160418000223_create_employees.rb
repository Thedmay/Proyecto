class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :rut
      t.string :clave
      t.string :email
      t.float :sueldo
      t.date :fecha_ingreso

      t.timestamps null: false
    end
  end
end
