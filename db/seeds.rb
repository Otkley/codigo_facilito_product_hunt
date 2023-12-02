require 'faker'

# rails db:setup

100.times do

  Product.create!(
    nombre: Faker::Name.name,
    description: Faker::Lorem.paragraphs,
  )

end

Category.create(name: "Desarrollo de software")
Category.create(name: "Desarrollo movil")
Category.create(name: "Ruby on Rails")