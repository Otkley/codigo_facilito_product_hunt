class CommentsController < ApplicationController
  before_action :set_product, only: [:create]

  def create
    @product.comments.create(comment_params)

    redirect_to @product, notice: "Comentario creado de forma exitosa."
  end

  private

  def set_product
    # como en al ruta ya no se muestra el id, si no el slug, buscamos por el slug_id del product
    @product = Product.find_by(slug:params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
