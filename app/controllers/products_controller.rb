class ProductsController < ApplicationController
  # metodo que recibe un simbolo a ejecutar antes de las acciones que van dentro del parametro only pasados como simbolo
  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    # este es el @product del form_with model: @product y se guarda con el submit
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "El producto se actualizo de forma exitosa."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.create(product_params)

    if @product.persisted?
      # notice es el parametro con el cual nosotros enviamos mensajes a la vista
      # helper_method: redirect_to vista/path, argumento:
      redirect_to product_path(@product), notice: "El producto se creo de forma exitosa."
    else
      #renderizamos la vista new, y con el status le hacemos saber al navegador que la peticion, no fue procesada
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:nombre, :description, :visible)
  end
end
