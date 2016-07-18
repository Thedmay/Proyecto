class Employee < ActiveRecord::Base
	validates :nombre, presence: true
	validates :rut, presence: true
	validates :rut, rut: true
	validates :rut, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :clave, presence: true
	validates :email, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, format: { :with => VALID_EMAIL_REGEX }
	validates :email, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
	validates :sueldo, presence: true
	validates :sueldo, numericality: { only_integer: true }
	validates :fecha_ingreso, presence: true
	has_many :lincenses
	has_many :assistances
	has_many :fechas, through: :assistances
	before_destroy :destroy_assistances, :destroy_lincenses

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
