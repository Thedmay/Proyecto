class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usuarios }
    end
  end


  # GET /usuarios/1
  # GET /usuarios/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usuario }
    end
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuarios_url, :notice => 'Usuario was successfully created.' }
        format.json { render :json => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update

    respond_to do |format|
      if @usuario.update_attributes(usuario_params)
        format.html { redirect_to usuarios_url, :notice => 'Usuario was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :ok }
    end
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nombre, :email, :encrypted_password, :permission_level)
  end

  def set_usuario
      @usuario = Usuario.find(params[:id])
  end
end
