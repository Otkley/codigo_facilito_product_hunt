Rails.application.routes.draw do
  # get 'products/index'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  get 'products/:id', to: 'products#show', as: :product
  # a partir de los nombres, ruby on rails nos genera los helpers para las rutas
  get 'products/:id/edit', to: 'products#edit', as: :edit_product
  patch 'products/:id', to: 'products#update'
  post 'products', to: 'products#create'

  root "main#welcome"
end
