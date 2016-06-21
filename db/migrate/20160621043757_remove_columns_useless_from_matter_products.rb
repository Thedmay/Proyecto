class RemoveColumnsUselessFromMatterProducts < ActiveRecord::Migration
  def change
  	remove_column :matter_products,:fecha
  	remove_column :matter_products,:nombre
  	remove_column :matter_products,:medida
  end
end
