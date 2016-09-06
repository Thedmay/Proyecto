class MatterProductsController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_matter_product, only: [:show, :edit, :update, :destroy]

  # GET /matter_products
  # GET /matter_products.json
  def index
    @matter_products = MatterProduct.all
  end

  # GET /matter_products/1
  # GET /matter_products/1.json
  def show
  end

  # GET /matter_products/new
  def new
    @matter_product = MatterProduct.new
  end

  # GET /matter_products/1/edit
  def edit
  end

  # POST /matter_products
  # POST /matter_products.json
  def create
    @matter_product = MatterProduct.new(matter_product_params)

    respond_to do |format|
      if @matter_product.save
        format.html { redirect_to @matter_product, notice: 'Matter product was successfully created.' }
        format.json { render :show, status: :created, location: @matter_product }
      else
        format.html { render :new }
        format.json { render json: @matter_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matter_products/1
  # PATCH/PUT /matter_products/1.json
  def update
    respond_to do |format|
      if @matter_product.update(matter_product_params)
        format.html { redirect_to @matter_product, notice: 'Matter product was successfully updated.' }
        format.json { render :show, status: :ok, location: @matter_product }
      else
        format.html { render :edit }
        format.json { render json: @matter_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matter_products/1
  # DELETE /matter_products/1.json
  def destroy
    @matter_product.destroy
    respond_to do |format|
      format.html { redirect_to matter_products_url, notice: 'Matter product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matter_product
      @matter_product = MatterProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matter_product_params
      params.require(:matter_product).permit(:nombre, :fecha, :materia, :cantidad, :medida, :Matter_id, :Product_id)
    end
end
