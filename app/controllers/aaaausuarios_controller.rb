class UsuariosController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  #before_action :blank, only: [:create, :update, :destroy]

  # GET /Usuarios
  # GET /Usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /Usuarios/1
  # GET /Usuarios/1.json
  def show
  end

  # GET /Usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /Usuarios/1/edit
  def edit
    @usuario = User.find(params[:id])
  end

  # POST /Usuarios
  # POST /Usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url, notice: 'Usuario fue creado existósamente.' }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Usuarios/1
  # PATCH/PUT /Usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_url, notice: 'Usuario fue editado existósamente.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Usuarios/1
  # DELETE /Usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario fue eliminado existósamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nombre, :email, :password, :password_confirmation)
    end

    def blank
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
end
