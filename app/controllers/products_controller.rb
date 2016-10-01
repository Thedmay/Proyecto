class ProductsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @cantidadesMatters = MatterProduct.cantidades(@product.id, 2)
    @cantidadPedidos = OrderProduct.sumaCantidad(@product.id, 0)
    @cantidadVentas = BillProduct.sumaCantidad(@product.id, 0)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.cantidadesMatters = params[:cantidadesMatters]
    @product.matters = params[:matters]

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.cantidadesMatters2=params[:cantidadesMatters]
    @product.matters2=params[:matters]
    @product.cantidadesMatters3=params[:cantidadesMatters2]
    @product.matters3=params[:matters2]
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Producto fue exitosamente editado.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Producto fue exitosamente destruido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:nombre, :codigo, :unidades, :category_id, :cantidadesMatters, :matters, :cantidadesMatters2, :matters2, :medida)
    end

    def validar_tablas1
      params[:cantidadesMatters].delete(0)
      if (params[:cantidadesMatters]!=nil and !params[:cantidadesMatters].empty?  and params[:matters]!=nil)
        params[:cantidadesMatters].each do |cant|
          if cant.to_i < 1
            return false
          end
        end
        return true
      else
        return false
      end
    end

    def validar_tablas2
      params[:cantidadesMatters2].delete(0)
      if (params[:cantidadesMatters2]!=nil and !params[:cantidadesMatters2].empty?  and params[:matters2]!=nil)
        params[:cantidadesMatters2].each do |cant|
          if cant.to_i < 1
            return false
          end
        end
        return true
      else
        return false
      end
    end

    def validar_ambas_tablas
      if params[:matters]==nil
        return validar_tablas2
      elsif params[:matters2]==nil
        return validar_tablas1
      else
        return (validar_tablas1 and validar_tablas2)
      end
    end
end
