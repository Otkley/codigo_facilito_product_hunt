class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end

  def new
    # este es el @product del form_with model: @product y se guarda con el submit
    @product = Product.new
  end
end
