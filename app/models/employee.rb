class Employee < ActiveRecord::Base
	has_many :lincenses
	has_many :assistances
	has_many :fechas, through: :assistances

end
