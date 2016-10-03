class UpdateColumnCodigo < ActiveRecord::Migration
  def change
  	remove_column :products, :codigo
  	add_column :products, :codigo, :integer
  end
end
