class Bill < ActiveRecord::Base
  validates :numero, presence: true
  validates :numero, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
  validates :fecha, presence: true
  validates :razon_social, presence: true
  validates :giro_comercial, presence: true
  validates :monto_neto, presence: true
  validates :iva, presence: true
  validates :total, presence: true
  belongs_to :customer
  has_many :bill_products
  has_many :products, through: :bill_products
  after_create :save_bill_products
  after_update :update_listProducts
  before_destroy :destroy_listProducts

  def cantidades=(cantidades)
    if cantidades != nil
      cantidades.delete('')
    end
    @cantidades=cantidades
  end

  def products=(products)
    @products=products
  end

  def cantidades2=(cantidades2)
    if cantidades2 != nil
      cantidades2.delete('')
    end
    @cantidades2=cantidades2
  end

  def products2=(products2)
    @products2=products2
  end

  def cantidades3=(cantidades3)
    if cantidades3 != nil
      cantidades3.delete('')
    end
    @cantidades3=cantidades3
  end

  def products3=(products3)
    @products3=products3
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

  def update_listProducts
    self.products.each do |product|
      if @products2==nil
        BillProduct.where(bill_id:self.id).each do |product|
          product.destroy
        end
        break
      else
        BillProduct.where(bill_id: self.id, product_id: product.id).each do |bill_product|
          i = @products2.find_index(product.id.to_s)
          if i == nil
            bill_product.destroy
          else
            bill_product.update(cantidad: @cantidades2[i])
          end
        end
      end
    end
    i=0
    while @products3 != nil and i < @products3.size()
      BillProduct.create(bill_id:self.id,
        cantidad:@cantidades3.at(i),
        product_id: @products3.at(i))
      i+=1
    end
  end

  def destroy_listProducts
    self.bill_products.each do |bill_product|
      bill_product.destroy
    end
  end
end
