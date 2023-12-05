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
#  slug        :string
#
class Product < ApplicationRecord
  # le indicamos a RoR que generaremos el slug del objeto a partir del campo nombre
  # annotate --models
  # Slug: string unico q reemplaza id por temas de seguridad no exponer data en la ruta-friendly_id gem
  extend FriendlyId
  friendly_id :nombre, use: :slugged

  # Valicacion: mecanismo de reglas para proteger los registros de nuestra base de datos

  # metodo validates recibe como primer argumento como simbolo el atributo a validar y despues definir el tipo de validación a aplicar
  # validates :nombre, uniqueness, length, presence, format(para regex), etc... y cada validación tiene sus metodos y argumentos para modificar

  # en el atributo errors dentro de los modelos/objetos, encontraremos todos los errores que se hayan generado a traves de las validaciónes y podemos entrar al atribudo messages para ver los errores ej: product.errors.messages #=> {:nombre => ["can't be blank"]}

  validates :nombre, presence: true
  validates :description, presence: { message: "La descripcion es requerida."}

  validates :nombre, length: {maximum: 200, minimum: 2}

  # con esto decimos que producto tendra un archivo, en este caso image y dependencia: destroy
  has_one_attached :image, :dependent => :destroy

  # relacion muchos a muchos con category por medio de product_categories
  has_many :product_categories
=begin
Product.last.product_categories.first.category a Product.categories

irb(main):004> Product.last.categories
  Product Load (0.3ms)  SELECT "products".* FROM "products" ORDER BY "products"."id" DESC LIMIT ?  [["LIMIT", 1]]
  Category Load (0.2ms)  SELECT "categories".* FROM "categories" INNER JOIN "product_categories" ON "categories"."id" = "product_categories"."category_id" WHERE "product_categories"."product_id" = ?  [["product_id", 101]]
=> 
[#<Category:0x000000010889c368
  id: 1,
  name: "Desarrollo de software",
  created_at: Sat, 02 Dec 2023 02:11:43.237398000 UTC +00:00,
  updated_at: Sat, 02 Dec 2023 02:11:43.237398000 UTC +00:00>]

  queremos obtener todos los categories a traves de product_categories y ActiveRecord hara internamente un join
=end
  has_many :categories, through: :product_categories # join

=begin
irb(main):015> product.categories << last_category
  TRANSACTION (0.1ms)  begin transaction
  ProductCategory Create (0.7ms)  INSERT INTO "product_categories" ("product_id", "category_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["product_id", 1], ["category_id", 3], ["created_at", "2023-12-02 02:27:42.013277"], ["updated_at", "2023-12-02 02:27:42.013277"]]
  TRANSACTION (0.6ms)  commit transaction
=> 
[#<Category:0x0000000108c7d720
  id: 3,
  name: "Ruby on Rails",
  created_at: Sat, 02 Dec 2023 02:11:43.239922000 UTC +00:00,
  updated_at: Sat, 02 Dec 2023 02:11:43.239922000 UTC +00:00>]
irb(main):016> 
=end 

  # indicamos que product tiene muchos comentarios
  has_many :comments, -> { order('id DESC') } # esto para ordenar los comentarios

 # le indicamos a ActiveRecord que estamos aceptando atributos anidados de la realcion con :categories
  accepts_nested_attributes_for :categories

  def category_default
    # return self.categories.first.name if self.categories.any?
    return categories.first.name if categories.any?

    'Sin Categoria'
  end
end
