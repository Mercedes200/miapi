class CosmeticosController < ApplicationController
  before_action :set_cosmetico, only: [:show, :update, :destroy]

  # GET /cosmeticos
  def index
    @cosmeticos = Cosmetico.all
    render json: @cosmeticos
  end
  #Categoria 
  def index
    if params[:category]
      @cosmeticos = Cosmetico.where(category: params[:category])
    else
      @cosmeticos = Cosmetico.all
    end
    render json: @cosmeticos
  end
  #busqueda 
  def search
    @cosmeticos = Cosmetico.where("nombre ILIKE :query OR descripcion ILIKE :query", query: "%#{params[:q]}%")
    render json: @cosmeticos
  end

  # GET /cosmeticos/:id
  def show
    render json: @cosmetico
  end

  # POST /cosmeticos
  def create
    @cosmetico = Cosmetico.new(cosmetico_params)

    if @cosmetico.save
      render json: @cosmetico, status: :created, location: @cosmetico
    else
      render json: @cosmetico.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cosmeticos/:id
  def update
    if @cosmetico.update(cosmetico_params)
      render json: @cosmetico
    else
      render json: @cosmetico.errors, status: :unprocessable_entity
    end
  end

  

  # DELETE /cosmeticos/:id
  def destroy
    @cosmetico.destroy
  end

  private

  # Encontrar un cosmético por su ID
  def set_cosmetico
    @cosmetico = Cosmetico.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Cosmético no encontrado' }, status: :not_found
  end

  # Permitir solo los parámetros permitidos
  def cosmetico_params
    params.require(:cosmetico).permit(:nombre, :categoria, :precio, :descripcion)
  end
end