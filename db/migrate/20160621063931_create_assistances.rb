class CreateAssistances < ActiveRecord::Migration
  def change
    create_table :assistances do |t|
      t.references :fecha, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.boolean :asiste

      t.timestamps null: false
    end
  end
end
