class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = Bill.where(anulado:true)
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
    if @bill.anulado == true
      @cantidadesProducts = BillProduct.cantidades(@bill.id, 1)
    else
      redirect_to bills_url
    end
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @num = Bill.last.numero+1
    @giros2=Array.new
    #aux = GiroComercial.all
    #aux.each |giro| do
    #  aux = [giro.id,giro.nombre]
    #  @giros2.push(aux)
    #end
    
    #@giros2 = Hash[GiroComercial.all.map { |var_tmp| [var_tmp.id.to_s, var_tmp.nombre.to_s ]}]
  end

  def get_cosas
    @giro_comercial = GiroComercial.where(id: 
      Customer.where(id: @bill.customer_id).each do |cust|
      cust.giro_comercial_id
    end)
  end

  # GET /bills/1/edit
  def edit
    @giros = GiroComercial.all
    @num = @bill.numero
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)
    @bill.cantidades = params[:cantidadesProducts]
    @bill.products = params[:products]
    respond_to do |format|
      if validar_suma && @bill.save
        format.html { redirect_to @bill, notice: 'Factura fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    @bill.products2=params[:products]
    @bill.products3=params[:products2]
    @bill.cantidades2=params[:cantidadesProducts]
    @bill.cantidades3=params[:cantidadesProducts2]
    respond_to do |format|
      if validar_suma && @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Factura  fue exitosamente editada.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.anular_bill
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Factura  fue exitosamente destruida.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:numero, :fecha, :razon_social, :giro_comercial, :monto_neto, :iva, :total, :customer_id, :cantidadesProducts, :products, :cantidadesProducts2, :products2)
    end

    def validar_suma
      return ((@bill.iva.to_i + @bill.monto_neto.to_i) == @bill.total.to_i)
    end

    def validar_tabla
      params[:cantidadesProducts].delete(0)
      if (params[:cantidadesProducts]!=nil and !params[:cantidadesProducts].empty? and params[:products]!=nil)
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
end
