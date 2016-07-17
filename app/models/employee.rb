class Employee < ActiveRecord::Base
	validates :nombre, presence: true
	validates :rut, presence: true
	validates :clave, presence: true
	validates :email, presence: true
	validates :sueldo, presence: true
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
