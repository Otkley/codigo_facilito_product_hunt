class ProductsController < ApplicationController
  def index
    @products = Product.where(visible: true).order('id DESC')
  end
end
