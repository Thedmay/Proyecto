class Customer < ActiveRecord::Base
	validates :nombre, presence: true
	validates :rut, presence: true
	validates :rut, rut: true
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :telefono, presence: true
	validates :telefono, numericality: { only_integer: true }
	validates :email, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
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
