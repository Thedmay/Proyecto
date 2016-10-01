class AddColumnToTables < ActiveRecord::Migration
  def change
  	remove_column :bills, :monto_neto
  	remove_column :bills, :iva
  	remove_column :bills, :total
  	add_column :bills, :monto_neto, :integer
  	add_column :bills, :iva, :integer
  	add_column :bills, :total, :integer
  	remove_column :employees, :sueldo
  	add_column :employees, :sueldo, :integer
  	remove_column :matters, :saldo
  	add_column :matters, :saldo, :integer
  	remove_column :orders, :cantidad
  	add_column :orders, :cantidad, :integer

  	add_column :bills, :anulado, :boolean, :default => true
  	add_column :customers, :razon_social, :string
  	add_reference :customers, :giro_comercial, index: true
  end
end
