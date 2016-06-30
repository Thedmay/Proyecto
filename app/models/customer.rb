class Customer < ActiveRecord::Base
	has_many :bills
	has_many :orders
	before_destroy :destroy_bills, :destroy_orders

	def destroy_bills
		self.bills.each do |bill|
			bill.destroy
		end
	end
	def destroy_orders
		self.orders.each do |order|
			order.destroy
		end
	end
end
