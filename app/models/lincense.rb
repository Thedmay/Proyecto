class Lincense < ActiveRecord::Base
	validates :employee_id, presence: { message: "NO puede dejarse vacío" }
	validates :duracion, presence: { message: "NO puede dejarse vacío" }
	validates :duracion, numericality: { only_integer: true, :message => "DEBE ser solo numeros" }
	validates_numericality_of :duracion,less_than_or_equal_to:3650,
                            :message => "Parece ser muy grande"
	validates :fechaInicio, presence: { message: "NO puede dejarse vacío"}
	validates :detalle, presence: { message: "NO puede dejarse vacío" }
	validates :detalle, length: {in: 10..5000, message: "debe tener entre 10 a 200 caracteres"}
  	belongs_to :employee
end
