class RemoveColumnCantidadFromProductAndMatter < ActiveRecord::Migration
  def change
  	remove_column :products, :cantidad
  	remove_column :matters, :cantidad
  end
end
