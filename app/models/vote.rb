# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_type :string           not null
#  votable_id   :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Vote < ApplicationRecord
  # rails g model vote votable:references{polymorphic}
  # con polymorphic le decimos a rails que tendra una relacion polimórficas
  # mediante la columna type sabremos a que tipo de objeto se hace referencia
  # y la columna id sabremos el objeto como tal
  # si nos fijamos que la relacion dice que le pertenece a un objeto votable que es de tipo polimorfico (que puede tomar diferentes formas)
  # Vote.create votable: product
  #   id: 1,
  #  votable_type: "Product",
  #  votable_id: 1

  # Vote.create votable: comment
  # id: 2,
  # votable_type: "Comment",
  # votable_id: 1
  belongs_to :votable, polymorphic: true
end