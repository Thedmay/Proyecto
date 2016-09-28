class Customer < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :rut, presence: {message: 'NO puede estar en blanco'}
	validates :rut, rut: {message: 'DEBE ser rut válido'}
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :telefono, presence: { message: "NO puede dejarse vacío" }
	validates :telefono, numericality: { only_integer: true , :message => "DEBE ser solo numeros"}
	validates :email, presence: { message: "NO puede dejarse vacío" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :direccion, presence:{ message: "NO puede dejarse vacío" }
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

	def self.listaFalsa(customer)
		array = Array.new
		array.push(customer)
		return array
	end
end
