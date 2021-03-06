class Order < ActiveRecord::Base
  validates :numero, presence: { message: "NO puede dejarse vacío" }
  validates :numero, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :numero, numericality: { only_integer: true, :message => "DEBE ser solo numeros" }
  validates_numericality_of :numero,less_than_or_equal_to:9999999,
                            :message => "Parece ser muy grande"
  validates :fecha, presence: { message: "NO puede dejarse vacío" }
  validates :customer_id, presence: { message: "NO puede dejarse vacío" }
  validates :fecha_final, presence: { message: "NO puede dejarse vacío" }
  belongs_to :customer
  has_many :order_products
  has_many :customer_matters
  has_many :products, through: :order_products
  has_many :matters, through: :customer_matters
  after_create :save_order_products, :save_order_matters
  after_update :update_listProducts, :update_listMatters
  before_destroy :destroy_listProducts, :destroy_listMatters

  def anular_bill
    self.update(:anulado => true)
  end

  def products=(products)
    @products=products
  end

  def cantidadesProducts=(cantidadesProducts)
    if cantidadesProducts != nil
      cantidadesProducts.delete('')
    end
    @cantidadesProducts=cantidadesProducts
  end

  def matters=(matters)
    @matters=matters
  end

  def cantidadesMatters=(cantidadesMatters)
    if cantidadesMatters != nil
      cantidadesMatters.delete('')
    end
    @cantidadesMatters=cantidadesMatters
  end

  def products2=(products2)
    @products2=products2
  end

  def cantidadesProducts2=(cantidadesProducts2)
    if cantidadesProducts2 != nil
      cantidadesProducts2.delete('')
    end
    @cantidadesProducts2=cantidadesProducts2
  end

  def matters2=(matters2)
    @matters2=matters2
  end

  def cantidadesMatters2=(cantidadesMatters2)
    if cantidadesMatters2 != nil
      cantidadesMatters2.delete('')
    end
    @cantidadesMatters2=cantidadesMatters2
  end

  def products3=(products3)
    @products3=products3
  end

  def cantidadesProducts3=(cantidadesProducts3)
    if cantidadesProducts3 != nil
      cantidadesProducts3.delete('')
    end
    @cantidadesProducts3=cantidadesProducts3
  end

  def matters3=(matters3)
    @matters3=matters3
  end

  def cantidadesMatters3=(cantidadesMatters3)
    if cantidadesMatters3 != nil
      cantidadesMatters3.delete('')
    end
    @cantidadesMatters3=cantidadesMatters3
  end

  def save_order_products
    i=0
    while @products!=nil and i < @products.size()
      OrderProduct.create(order_id:self.id,
        cantidad:@cantidadesProducts.at(i),
        product_id: @products.at(i))
      i+=1
    end
  end

  def save_order_matters
    i=0
    while @matters!=nil and i < @matters.size()
      CustomerMatter.create(order_id:self.id,
        cantidad:@cantidadesMatters.at(i),
        matter_id: @matters.at(i))
      i+=1
    end
  end

  def update_listProducts
    self.products.each do |product|
      if @products2==nil
        OrderProduct.where(order_id: self.id).each do |product|
          product.destroy
        end
        break
      else
        OrderProduct.where(order_id: self.id, product_id: product.id).each do |order_product|
          i = @products2.find_index(product.id.to_s)
          if i == nil
            order_product.destroy
          else
            order_product.update(cantidad: @cantidadesProducts2[i])
          end
        end
      end
    end
    i=0
    while @products3 != nil and i < @products3.size()
      OrderProduct.create(order_id:self.id,
        cantidad:@cantidadesProducts3.at(i),
        product_id: @products3.at(i))
      i+=1
    end
  end

  def update_listMatters
    self.matters.each do |matter|
      if @matters2==nil
        CustomerMatter.where(order_id: self.id).each do |matter|
          matter.destroy
        end
        break
      else
        CustomerMatter.where(order_id: self.id, matter_id: matter.id).each do |customer_matter|
          i = @matters2.find_index(matter.id.to_s)
          if i == nil
            customer_matter.destroy
          else
            customer_matter.update(cantidad: @cantidadesMatters2[i])
          end
        end
      end
    end
    i=0
    while @matters3 != nil and i < @matters3.size()
      CustomerMatter.create(order_id:self.id,
        cantidad:@cantidadesMatters3.at(i),
        matter_id: @matters3.at(i))
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
