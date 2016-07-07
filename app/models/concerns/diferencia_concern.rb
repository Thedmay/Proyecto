module DiferenciaConcern
	extend ActiveSupport::Concern

	module ClassMethods
		def diferencia(arreglo)
			aux = Array.new
			all.each do |element|
			  if !arreglo.include?(element)
			    aux.push(element)
			  end
			end
			return aux
		end
	end
end