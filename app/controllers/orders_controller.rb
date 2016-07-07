class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cantidadesProducts = OrderProduct.cantidades(@order.id, 0)
    @cantidadesMatters = CustomerMatter.cantidades(@order.id, 0)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @products = Product.all
    @matters = Matter.all
  end

  # GET /orders/1/edit
  def edit
    @matters = Matter.all
    @products = Product.all
    @productsMiss = Product.diferencia(@order.products)
    @mattersMiss = Matter.diferencia(@order.matters)
    @cantidadesProducts = OrderProduct.cantidades(@order.id, 0)
    @cantidadesMatters = CustomerMatter.cantidades(@order.id, 0)
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
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
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
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
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
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
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
      params.require(:order).permit(:numero, :fecha, :detalle, :cantidad, :medida, :customer_id, :cantidadesProducts, :products, :matters, :cantidadesMatters, :cantidadesProducts2, :products2, :matters2, :cantidadesMatters2)
    end
end
