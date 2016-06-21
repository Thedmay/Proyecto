class CreateLincenses < ActiveRecord::Migration
  def change
    create_table :lincenses do |t|
      t.references :employee, index: true, foreign_key: true
      t.date :fechaInicio
      t.integer :duracion
      t.text :detalle

      t.timestamps null: false
    end
  end
end
