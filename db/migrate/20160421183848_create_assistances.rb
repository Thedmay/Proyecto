class CreateAssistances < ActiveRecord::Migration
  def change
    create_table :assistances do |t|
      t.boolean :asiste
      t.boolean :licencia
      t.date :fecha
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
