class Bill < ActiveRecord::Base
  belongs_to :customer
  has_many :bill_products
  has_many :products, through: :bill_products
  after_create :save_bill_products
  before_destroy :destroy_listProducts

  def cantidades=(cantidades)
  	@cantidades=cantidades
  end

  def products=(products)
  	@products=products
  end

  def save_bill_products
  	i=0
  	while i < @products.size()
  		BillProduct.create(bill_id:self.id,
  			cantidad:@cantidades.at(i),
  			product_id: @products.at(i))
  		i+=1
  	end
  end

  def destroy_listProducts
    self.bill_products.each do |bill_product|
      bill_product.destroy
    end
  end
end
