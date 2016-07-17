class Category < ActiveRecord::Base
	validates :nombre, presence: true
	has_many :products;
	before_destroy :destroy_products

	def destroy_products
		self.products.each do |product|
			product.destroy
		end
	end
end
