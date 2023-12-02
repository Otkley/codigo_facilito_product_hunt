# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  # relacion muchos a muchos con product por medio de product_categories
  has_many :product_categories
  has_many :products, through: :product_categories
end
