class RemoveColumnWithNoUseInTables < ActiveRecord::Migration
  def change
  	remove_column :employees, :clave
  	remove_column :products, :fecha_produce
  	remove_column :matters, :fecha_ingreso
  	add_column :orders, :fecha_final, :date
  end
end
