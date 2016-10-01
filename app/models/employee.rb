class Employee < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :nombre, presence: true, length:{in:5..200,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  	validates_format_of :nombre, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                      :message => "Invalido"
	validates :rut, presence: { message: "NO puede dejarse vacío" }
	validates :rut, rut: true
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :email, presence: { message: "NO puede dejarse vacío" }
	validates_format_of :rut,
                      :with => /\A(\d{1,3})\.(\d{3})\.(\d{3})\-(k|\d{1})\Z/i,
                      :message => "Formato no Valido EJ: 123.456.789-k"
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :nombre, presence: true, length:{in:5..200,
			  too_short:"demasiado corto",
			  too_long:"demasiado largo"}
	validates :sueldo, presence: { message: "NO puede dejarse vacío" }
	validates :sueldo, numericality: { only_integer: true, :message => "DEBE ser solo numeros" }
	validates_numericality_of :sueldo,less_than_or_equal_to:100000000,
                            :message => "Parece ser muy grande"
	validates :fecha_ingreso, presence: { message: "NO puede dejarse vacío" }
	has_many :lincenses
	has_many :assistances
	has_many :fechas, through: :assistances
	before_destroy :destroy_assistances, :destroy_lincenses

	include DiferenciaConcern

	def destroy_assistances
		self.assistances.each do |assistance|
			assistance.destroy
		end
	end

	def destroy_lincenses
		self.lincenses.each do |lincense|
			lincense.destroy
		end
	end
end
