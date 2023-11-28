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
end
