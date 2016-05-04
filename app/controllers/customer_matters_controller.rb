class CustomerMattersController < ApplicationController
  before_action :set_customer_matter, only: [:show, :edit, :update, :destroy]

  # GET /customer_matters
  # GET /customer_matters.json
  def index
    @customer_matters = CustomerMatter.all
  end

  # GET /customer_matters/1
  # GET /customer_matters/1.json
  def show
  end

  # GET /customer_matters/new
  def new
    @customer_matter = CustomerMatter.new
  end

  # GET /customer_matters/1/edit
  def edit
  end

  # POST /customer_matters
  # POST /customer_matters.json
  def create
    @customer_matter = CustomerMatter.new(customer_matter_params)

    respond_to do |format|
      if @customer_matter.save
        format.html { redirect_to @customer_matter, notice: 'Customer matter was successfully created.' }
        format.json { render :show, status: :created, location: @customer_matter }
      else
        format.html { render :new }
        format.json { render json: @customer_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_matters/1
  # PATCH/PUT /customer_matters/1.json
  def update
    respond_to do |format|
      if @customer_matter.update(customer_matter_params)
        format.html { redirect_to @customer_matter, notice: 'Customer matter was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_matter }
      else
        format.html { render :edit }
        format.json { render json: @customer_matter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_matters/1
  # DELETE /customer_matters/1.json
  def destroy
    @customer_matter.destroy
    respond_to do |format|
      format.html { redirect_to customer_matters_url, notice: 'Customer matter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_matter
      @customer_matter = CustomerMatter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_matter_params
      params.require(:customer_matter).permit(:customer_id, :matter_id)
    end
end
