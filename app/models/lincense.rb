class Lincense < ActiveRecord::Base
	validates :employee_id, presence: true
	validates :duracion, presence: true
	validates :fechaInicio, presence: true
	validates :detalle, presence: true
  	belongs_to :employee
end
