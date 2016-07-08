module CantidadConcern
	extend ActiveSupport::Concern
	
	module ClassMethods
		def cantidades(id, tipo)
			aux = Array.new
			string = ""
			if tipo == 0
				string = "order_id="+id.to_s
			end
			if tipo == 1
				string = "bill_id="+id.to_s
			end
			if tipo == 2
				string = "product_id="+id.to_s
			end
			where(string).each do |elemento|
				aux.push(elemento.cantidad)
			end
			return aux
		end

		def sumaCantidad(id, tipo)
			suma = 0
			string = ""
			if tipo == 0
				string = "product_id="+id.to_s
			end
			if tipo == 1
				string = "matter_id="+id.to_s
			end
			where(string).each do |elemento|
				suma += elemento.cantidad
			end
			return suma
		end
	end
end