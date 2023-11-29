Rails.application.routes.draw do
  # get 'products/index'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  get 'products/:id', to: 'products#show', as: :product
  post 'products', to: 'products#create'

  root "main#welcome"
end
