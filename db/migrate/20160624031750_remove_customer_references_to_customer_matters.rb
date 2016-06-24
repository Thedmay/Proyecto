class RemoveCustomerReferencesToCustomerMatters < ActiveRecord::Migration
  def change
  	remove_reference(:customer_matters, :customer, index: true, foreign_key: true)
  end
end
