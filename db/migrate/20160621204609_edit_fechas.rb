class EditFechas < ActiveRecord::Migration
  def change
  	remove_column :fechas,:dia
  	remove_column :fechas,:mes
  	remove_column :fechas,:año
  	add_column :fechas, :fecha, :date
  end
end
