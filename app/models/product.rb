# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  nombre      :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
  # Valicacion: mecanismo de reglas para proteger los registros de nuestra base de datos

  # metodo validates recibe como primer argumento como simbolo el atributo a validar y despues definir el tipo de validación a aplicar
  # validates :nombre, uniqueness, length, presence, format(para regex), etc... y cada validación tiene sus metodos y argumentos para modificar

  # en el atributo errors dentro de los modelos/objetos, encontraremos todos los errores que se hayan generado a traves de las validaciónes y podemos entrar al atribudo messages para ver los errores ej: product.errors.messages #=> {:nombre => ["can't be blank"]}

  validates :nombre, presence: true
  validates :description, presence: { message: "La descripcion es requerida."}

  validates :nombre, length: {maximum: 200, minimum: 2}
end
