class RemoveAnotherColumn < ActiveRecord::Migration
  def change
  	remove_column :matters, :fecha_utiliza
  end
end
