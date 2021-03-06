class OrdersController < ApplicationController
  #before_action :authenticate_usuario! || :authenticate_customer!
  before_action :set_order, only: [:show, :edit, :update, :destroy, :bill]

  # GET /orders
  # GET /orders.json

  def index
    @orders = Order.where(anulado:false)
  end

  def llenar
    @materiales=Matter.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if @order.anulado == false
      @cantidadesProducts = OrderProduct.cantidades(@order.id, 0)
      @cantidadesMatters = CustomerMatter.cantidades(@order.id, 0)
    else
      redirect_to orders_url
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    @materiales = nil
    @num = Order.last.numero+1
  end

  def bill
    @bill = Bill.new
    @num = Bill.last.numero+1
  end

  # GET /orders/1/edit
  def edit
    @num = @order.numero
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.cantidadesProducts = params[:cantidadesProducts]
    @order.products = params[:products]
    @order.matters = params[:matters]
    @order.cantidadesMatters = params[:cantidadesMatters]

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Pedido fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order.products2 = params[:products]
    @order.products3 = params[:products2]
    @order.matters2 = params[:matters]
    @order.matters3 = params[:matters2]
    @order.cantidadesProducts2 = params[:cantidadesProducts]
    @order.cantidadesProducts3 = params[:cantidadesProducts2]
    @order.cantidadesMatters2 = params[:cantidadesMatters]
    @order.cantidadesMatters3 = params[:cantidadesMatters2]

    respond_to do |format|
      if  @order.update(order_params)
        format.html { redirect_to @order, notice: 'Pedido fue exitosamente editado.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.anular_order
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Pedido fue exitosamente destruido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:estado,:numero, :fecha, :customer_id, :cantidadesProducts, :products, :matters, :cantidadesMatters, :cantidadesProducts2, :products2, :matters2, :cantidadesMatters2, :fecha_final)
    end

    def validar_tablas1_matter
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
      return 
    end

    def validar_tablas2_matter
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

    def validar_tablas1_product
      params[:cantidadesProducts].delete(0)
      if (params[:cantidadesProducts]!=nil and !params[:cantidadesProducts].empty?  and params[:products]!=nil)
        params[:cantidadesProducts].each do |cant|
          if cant.to_i < 1
            return false
          end
        end
        return true
      else
        return false
      end
      return 
    end

    def validar_tablas2_product
      params[:cantidadesProducts2].delete(0)
      if (params[:cantidadesProducts2]!=nil and !params[:cantidadesProducts2].empty?  and params[:products2]!=nil)
        params[:cantidadesProducts2].each do |cant|
          if cant.to_i < 1
            return false
          end
        end
        return true
      else
        return false
      end
    end

    def validar_matter_product
      return (validar_tablas1_product and validar_tablas1_matter)
    end

    def validar_todo
      return (validar_ambas_tablas_product and validar_ambas_tablas_matter)
    end

    def validar_ambas_tablas_product
      if params[:products]==nil
        return validar_tablas2_product
      elsif params[:products2]==nil
        return validar_tablas1_product
      else
        return (validar_tablas1_product and validar_tablas2_product)
      end
    end

    def validar_ambas_tablas_matter
      if params[:matters]==nil
        return validar_tablas2_matter
      elsif params[:matters2]==nil
        return validar_tablas1_matter
      else
        return (validar_tablas1_matter and validar_tablas2_matter)
      end
    end
end
