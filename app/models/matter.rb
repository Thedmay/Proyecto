class Matter < ActiveRecord::Base
	validates :nombre, presence: { message: "NO puede dejarse vacío" }
	validates :medida, presence: { message: "NO puede dejarse vacío" }
	validates :saldo, presence: { message: "NO puede dejarse vacío" }
	has_many :matter_products
	has_many :customer_matters
	has_many :products, through: :matter_products
	has_many :matters, through: :customer_matters
	before_destroy :destroy_listMatters, :destroy_listProducts

	include DiferenciaConcern

	def destroy_listMatters
		self.customer_matters.each do |customer_matter|
			customer_matter.destroy
		end
	end

	def destroy_listProducts
		self.matter_products.each do |matter_product|
			matter_product.destroy
		end
	end
end
