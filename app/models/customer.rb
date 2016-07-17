class Customer < ActiveRecord::Base
	validates :nombre, presence: true
	validates :rut, presence: true
	validates :telefono, presence: true
	validates :email, presence: true
	validates :direccion, presence: true
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
