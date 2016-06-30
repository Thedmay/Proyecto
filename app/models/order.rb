class Order < ActiveRecord::Base
  belongs_to :customer
  has_many :order_products
  has_many :customer_matters
  has_many :products, through: :order_products
  has_many :matters, through: :customer_matters
  after_create :save_order_products
  before_destroy :destroy_listProducts, :destroy_listMatters

  def cantidades=(cantidades)
  	@cantidades=cantidades
  end

  def products=(products)
  	@products=products
  end

  def matters=(matters)
    @matters=matters
  end

  def save_order_products
  	i=0
  	while i < @products.size()
  		OrderProduct.create(order_id:self.id,
  			cantidad:@cantidades.at(i),
  			product_id: @products.at(i))
  		i+=1
  	end
  end

  def destroy_listProducts
    self.order_products.each do |order_product|
      order_product.destroy
    end
  end

  def destroy_listMatters
    self.customer_matters.each do |customer_matter|
      customer_matter.destroy
    end
  end
end
