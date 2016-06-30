class Product < ActiveRecord::Base
  belongs_to :category
  has_many :matter_products
  has_many :bill_products
  has_many :order_products
  has_many :matters, through: :matter_products
  after_create :save_matter_products
  before_destroy :destroy_listMatters, :destroy_listOrders, :destroy_listBills

  def cantidades=(cantidades)
  	@cantidades=cantidades
  end

  def matters=(matters)
    @matters=matters
  end

  def save_matter_products
  	i=0
  	while i < @matters.size()
  		MatterProduct.create(product_id:self.id,
  			cantidad:@cantidades.at(i),
  			matter_id: @matters.at(i))
  		i+=1
  	end
  end

  def destroy_listMatters
    self.matter_products.each do |matter_product|
      matter_product.destroy
    end
  end

  def destroy_listOrders
    self.order_products.each do |order_product|
      order_product.destroy
    end
  end

  def destroy_listBills
    self.bill_products.each do |bill_product|
      bill_product.destroy
    end
  end
end
