class GiroComercial < ActiveRecord::Base
	has_many :customers
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :nombre, presence: true, length:{in:3..200,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  	validates_format_of :nombre, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                      :message => "Invalido"
end
