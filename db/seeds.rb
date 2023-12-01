require 'faker'

# rails db:setup

100.times do

  Product.create!(
    nombre: Faker::Name.name,
    description: Faker::Lorem.paragraphs,
  )

end