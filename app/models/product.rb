class Product < ActiveRecord::Base
  belongs_to :category
  has_many :matter_products
  has_many :matters, through: :matter_products
  after_create :save_matter_products

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
end
