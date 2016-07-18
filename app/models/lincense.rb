class Lincense < ActiveRecord::Base
	validates :employee_id, presence: true
	validates :duracion, presence: true
	validates :duracion, numericality: { only_integer: true }
	validates :fechaInicio, presence: true
	validates :detalle, presence: true
  	belongs_to :employee
end
