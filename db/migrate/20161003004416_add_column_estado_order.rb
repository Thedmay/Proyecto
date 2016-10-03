class AddColumnEstadoOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :estado, :integer, :default => 0
  end
end
