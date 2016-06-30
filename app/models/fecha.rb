class Fecha < ActiveRecord::Base
	has_many :assistances
	has_many :employees, through: :assistances
	after_create :save_assistances
	before_destroy :destroy_assistances

	def employees=(employees)
		@employees=employees
	end

	def save_assistances
		@employees.each do |employee|
			Assistance.create(fecha_id:self.id,
				employee_id:employee,
				asiste:true)
		end
	end

	def destroy_assistances
		self.assistances.each do |assistance|
			assistance.destroy
		end
	end
end
