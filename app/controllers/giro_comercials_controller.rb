class GiroComercialsController < ApplicationController
  before_action :set_giro_comercial, only: [:show, :edit, :update, :destroy]

  # GET /giro_comercials
  # GET /giro_comercials.json
  def index
    @giro_comercials = GiroComercial.all
  end

  # GET /giro_comercials/1
  # GET /giro_comercials/1.json
  def show
  end

  # GET /giro_comercials/new
  def new
    @giro_comercial = GiroComercial.new
  end

  # GET /giro_comercials/1/edit
  def edit
  end

  # POST /giro_comercials
  # POST /giro_comercials.json
  def create
    @giro_comercial = GiroComercial.new(giro_comercial_params)

    respond_to do |format|
      if @giro_comercial.save
        format.html { redirect_to @giro_comercial, notice: 'Giro comercial fue exitosamente creado.' }
        format.json { render :show, status: :created, location: @giro_comercial }
      else
        format.html { render :new }
        format.json { render json: @giro_comercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /giro_comercials/1
  # PATCH/PUT /giro_comercials/1.json
  def update
    respond_to do |format|
      if @giro_comercial.update(giro_comercial_params)
        format.html { redirect_to @giro_comercial, notice: 'Giro comercial  fue exitosamente editado.' }
        format.json { render :show, status: :ok, location: @giro_comercial }
      else
        format.html { render :edit }
        format.json { render json: @giro_comercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /giro_comercials/1
  # DELETE /giro_comercials/1.json
  def destroy
    @giro_comercial.destroy
    respond_to do |format|
      format.html { redirect_to giro_comercials_url, notice: 'Giro comercial  fue exitosamente destruido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_giro_comercial
      @giro_comercial = GiroComercial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def giro_comercial_params
      params.require(:giro_comercial).permit(:nombre)
    end
end
