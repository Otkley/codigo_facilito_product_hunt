class VotesController < ApplicationController
  before_action :set_product, only: [:create]

  def create
    Vote.create votable:@product

    redirect_to @product, notice: "Gracias por tu voto."
  end

  private

  def set_product
    # como en al ruta ya no se muestra el id, si no el slug, buscamos por el slug_id del product
    @product = Product.find_by(slug:params[:product_id])
  end
end
