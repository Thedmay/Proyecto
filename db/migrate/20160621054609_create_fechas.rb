class CreateFechas < ActiveRecord::Migration
  def change
    create_table :fechas do |t|
      t.integer :dia
      t.integer :mes
      t.integer :año

      t.timestamps null: false
    end
  end
end
