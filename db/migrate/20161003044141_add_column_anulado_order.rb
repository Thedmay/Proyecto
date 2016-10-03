class AddColumnAnuladoOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :anulado, :boolean, :default => false
  end
end
