class AddOrderReferencesToCustomerMatter < ActiveRecord::Migration
  def change
  	add_reference :customer_matters, :order, index: true
  end
end
