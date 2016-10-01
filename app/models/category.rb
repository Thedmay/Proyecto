class Category < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :nombre, presence: true, length:{in:3..200,
          too_short:"demasiado corto",
          too_long:"demasiado largo"}
  	validates_format_of :nombre, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/,
                      :message => "Invalido"

	has_many :products;
	before_destroy :destroy_products

	def destroy_products
		self.products.each do |product|
			product.destroy
		end
	end
end
