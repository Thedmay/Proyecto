class Customer < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :nombre, presence: true, length:{in:3..200,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  	validates_format_of :nombre, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                      :message => "Invalido"
	validates_format_of :rut,
                      :with => /\A(\d{1,3})\.(\d{3})\.(\d{3})\-(k|\d{1})\Z/i,
                      :message => "Formato no Valido EJ: 123.456.789-k"
	validates :rut, presence: {message: 'NO puede estar en blanco'}
	validates :rut, rut: {message: 'DEBE ser rut válido'}
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :telefono, presence: { message: "NO puede dejarse vacío" }
	validates :telefono, numericality: { only_integer: true , :message => "DEBE ser solo numeros"}
	validates :telefono, length: { in:7..8 , message: ": ingrese un número correcto ejemplo 12345678"}
	validates :email, presence: { message: "NO puede dejarse vacío" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :direccion, presence:{ message: "NO puede dejarse vacío" }
	validates :nombre, presence: true, length:{in:5..200,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
	has_many :bills
	has_many :orders
	belongs_to :giro_comercials
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
