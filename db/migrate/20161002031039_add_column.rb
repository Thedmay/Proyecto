class AddColumn < ActiveRecord::Migration
  def change
  	add_column :products, :precio, :integer
  end
end
