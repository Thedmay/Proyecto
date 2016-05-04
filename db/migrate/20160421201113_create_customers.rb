class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :nombre
      t.string :rut
      t.integer :telefono
      t.string :email
      t.string :direccion

      t.timestamps null: false
    end
  end
end
