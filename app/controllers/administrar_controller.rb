class AdministrarController < ApplicationController
	before_action :authenticate_usuario!
	
	def index
		@correos, @nombres, @fechas = Usuario.info
	end
end
