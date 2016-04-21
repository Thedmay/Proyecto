class BillProductsController < ApplicationController
  before_action :set_bill_product, only: [:show, :edit, :update, :destroy]

  # GET /bill_products
  # GET /bill_products.json
  def index
    @bill_products = BillProduct.all
  end

  # GET /bill_products/1
  # GET /bill_products/1.json
  def show
  end

  # GET /bill_products/new
  def new
    @bill_product = BillProduct.new
  end

  # GET /bill_products/1/edit
  def edit
  end

  # POST /bill_products
  # POST /bill_products.json
  def create
    @bill_product = BillProduct.new(bill_product_params)

    respond_to do |format|
      if @bill_product.save
        format.html { redirect_to @bill_product, notice: 'Bill product was successfully created.' }
        format.json { render :show, status: :created, location: @bill_product }
      else
        format.html { render :new }
        format.json { render json: @bill_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bill_products/1
  # PATCH/PUT /bill_products/1.json
  def update
    respond_to do |format|
      if @bill_product.update(bill_product_params)
        format.html { redirect_to @bill_product, notice: 'Bill product was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill_product }
      else
        format.html { render :edit }
        format.json { render json: @bill_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_products/1
  # DELETE /bill_products/1.json
  def destroy
    @bill_product.destroy
    respond_to do |format|
      format.html { redirect_to bill_products_url, notice: 'Bill product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill_product
      @bill_product = BillProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_product_params
      params.require(:bill_product).permit(:Bill_id, :Product_id)
    end
end
