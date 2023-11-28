class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    # este es el @product del form_with model: @product y se guarda con el submit
    @product = Product.new
  end

  def create
    @product = Product.create!(product_params)

    # helper_method: redirect_to
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:nombre, :description, :visible)
  end
end
