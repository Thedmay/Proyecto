	class Customer < ActiveRecord::Base
	has_many :bills
	has_many :orders
	has_many :customer_matters
	has_many :matters, through: :customer_matters
	after_create :save_bill_products

	def cantidades=(cantidades)
  		@cantidades=cantidades
  	end

  	def matters=(matters)
  		@matters=matters
  	end

  	def save_bill_products
	  	i=0
	  	while i < @matters.size()
	  		CustomerMatter.create(customer_id:self.id,
	  			cantidad:@cantidades.at(i),
	  			matter_id: @matters.at(i))
	  		i+=1
	  	end
	end
end
