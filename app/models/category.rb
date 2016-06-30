class Category < ActiveRecord::Base
	has_many :products;
	before_destroy :destroy_products

	def destroy_products
		self.products.each do |product|
			product.destroy
		end
	end
end
