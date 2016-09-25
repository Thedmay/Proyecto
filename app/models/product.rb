class Product < ActiveRecord::Base
  validates :nombre, presence: true
  validates :codigo, presence: true
  validates :codigo, numericality: { only_integer: true }
  validates :unidades, presence: true
  validates :unidades, numericality: { only_integer: true }
  validates :medida, presence: true
  validates :fecha_produce, presence: true
  validates :category_id, presence: true
  belongs_to :category
  has_many :matter_products
  has_many :bill_products
  has_many :order_products
  has_many :matters, through: :matter_products
  after_create :save_matter_products
  after_update :update_listMatters
  before_destroy :destroy_listMatters, :destroy_listOrders, :destroy_listBills

  include DiferenciaConcern

  def cantidadesMatters=(cantidadesMatters)
    if cantidadesMatters!=nil
      cantidadesMatters.delete('')
    end
    @cantidadesMatters=cantidadesMatters
  end

  def matters=(matters)
    @matters=matters
  end

  def cantidadesMatters2=(cantidadesMatters2)
    if cantidadesMatters2!=nil
      cantidadesMatters2.delete('')
    end
    @cantidadesMatters2=cantidadesMatters2
  end

  def matters2=(matters2)
    @matters2=matters2
  end

  def cantidadesMatters3=(cantidadesMatters3)
    if cantidadesMatters3!=nil
      cantidadesMatters3.delete('')
    end
    @cantidadesMatters3=cantidadesMatters3
  end

  def matters3=(matters3)
    @matters3=matters3
  end

  def save_matter_products
  	i=0
  	while i < @matters.size()
  		MatterProduct.create(product_id:self.id,
  			cantidad:@cantidadesMatters.at(i),
  			matter_id: @matters.at(i))
  		i+=1
  	end
  end

  def update_listMatters
    self.matters.each do |matter|
      if @matters2==nil
        MatterProduct.where(product_id: self.id).each do |matter_product|
          matter_product.destroy
        end
        break
      else
        MatterProduct.where(product_id:self.id, matter_id:matter.id).each do |matter_product|
          i = @matters2.find_index(matter.id.to_s)
          if i == nil
            matter_product.destroy
          else
            matter_product.update(cantidad:@cantidadesMatters2[i])
          end
        end
      end
    end
    i=0
    while @matters3 != nil and i < @matters3.size()
      MatterProduct.create(product_id:self.id,
        cantidad:@cantidadesMatters3.at(i),
        matter_id: @matters3.at(i))
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
