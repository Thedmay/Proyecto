class Employee < ActiveRecord::Base
	has_many :lincense
	has_many :assistances
	has_many :fechas, through: :assistances

end
