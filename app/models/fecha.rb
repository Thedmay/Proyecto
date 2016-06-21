class Fecha < ActiveRecord::Base
	has_many :assistances
	has_many :employees, through: :assistances
	after_create :save_assistances

	def employees=(employees)
		@employees=employees
	end

	def save_assistances
		@employees.each do |employee|
			Assistance.create(fecha_id:self.id,
				employee_id:employee.at(i),
				asiste:true)
		end
	end
end
