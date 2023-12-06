class VotesController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_comment, only: [:create]
  before_action :set_votable, only: [:create]

  def create
    Vote.create(votable:@votable)

    redirect_to @product, notice: "Gracias por tu voto."
  end

  private

  # asi como set_comment, si el comment existe en la ruta significa que se votara por el commentario y si no, significa que el voto va sobre el producto
  def set_votable
    if @comment
      @votable = @comment
    else
      @votable = @product
    end
  end

  # seteamos el comentario ya que si esperamos poder votar sobre un comentario va a venir en la ruta, condicionamos ya que es importante que comment_id este o no este para saber a quien vamos a votar
  def set_comment
    @comment = Comment.find(params[:comment_id]) if params.has_key? :comment_id
  end

  def set_product
    # como en al ruta ya no se muestra el id, si no el slug, buscamos por el slug_id del product
    @product = Product.find_by(slug:params[:product_id])
  end
end
