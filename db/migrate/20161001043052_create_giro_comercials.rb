class CreateGiroComercials < ActiveRecord::Migration
  def change
    create_table :giro_comercials do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
