class Employee < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :rut, presence: { message: "NO puede dejarse vacío" }
	validates :rut, rut: true
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :email, presence: { message: "NO puede dejarse vacío" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :sueldo, presence: { message: "NO puede dejarse vacío" }
	validates :sueldo, numericality: { only_integer: true, :message => "DEBE ser solo numeros" }
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
