class LincensesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_lincense, only: [:show, :edit, :update, :destroy]

  # GET /lincenses
  # GET /lincenses.json
  def index
    @lincenses = Lincense.all
  end

  # GET /lincenses/1
  # GET /lincenses/1.json
  def show
  end

  # GET /lincenses/new
  def new
    @lincense = Lincense.new
  end

  # GET /lincenses/1/edit
  def edit
  end

  # POST /lincenses
  # POST /lincenses.json
  def create
    @lincense = Lincense.new(lincense_params)

    respond_to do |format|
      if @lincense.save
        format.html { redirect_to @lincense, notice: 'Lincense was successfully created.' }
        format.json { render :show, status: :created, location: @lincense }
      else
        format.html { render :new }
        format.json { render json: @lincense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lincenses/1
  # PATCH/PUT /lincenses/1.json
  def update
    respond_to do |format|
      if @lincense.update(lincense_params)
        format.html { redirect_to @lincense, notice: 'Lincense was successfully updated.' }
        format.json { render :show, status: :ok, location: @lincense }
      else
        format.html { render :edit }
        format.json { render json: @lincense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lincenses/1
  # DELETE /lincenses/1.json
  def destroy
    @lincense.destroy
    respond_to do |format|
      format.html { redirect_to lincenses_url, notice: 'Lincense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lincense
      @lincense = Lincense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lincense_params
      params.require(:lincense).permit(:employee_id, :fechaInicio, :duracion, :detalle)
    end
end
