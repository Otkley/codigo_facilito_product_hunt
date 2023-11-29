class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    # este es el @product del form_with model: @product y se guarda con el submit
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.persisted?
      # notice es el parametro con el cual nosotros enviamos mensajes a la vista
      # helper_method: redirect_to vista/path, argumento:
      redirect_to products_path, notice: "El producto se creo de forma exitosa."
    else
      #renderizamos la vista new, y con el status le hacemos saber al navegador que la peticion, no fue procesada
      render :new, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:nombre, :description, :visible)
  end
end
