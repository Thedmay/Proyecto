class CreateMatterProducts < ActiveRecord::Migration
  def change
    create_table :matter_products do |t|
      t.references :matter, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.string :nombre
      t.date :fecha
      t.integer :cantidad
      t.string :medida

      t.timestamps null: false
    end
  end
end
