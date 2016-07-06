class Fecha < ActiveRecord::Base
	has_many :assistances
	has_many :employees, through: :assistances
	after_create :save_assistances
	after_update :update_employees
	before_destroy :destroy_assistances

	def employees=(employees)
		@employees=employees
	end

	def employees2=(employees2)
		@employees2=employees2
	end

	def employees3=(employees3)
		@employees3=employees3
	end

	def save_assistances
		if @employees != nil
			@employees.each do |employee|
				Assistance.create(fecha_id:self.id,
					employee_id:employee,
					asiste:true)
			end
		end
	end

	def destroy_assistances
		self.assistances.each do |assistance|
			assistance.destroy
		end
	end

	def update_employees
		self.employees.each do |employee|
			if !employees2.include?(employee)
				employee.destroy
			end
		end
		if @employees3 != nil
			@employees3.each do |employee|
				Assistance.create(fecha_id:self.id,
					employee_id:employee,
					asiste:true)
			end
		end
	end
end
