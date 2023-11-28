Rails.application.routes.draw do
  # get 'products/index'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  post 'products', to: 'products#create'

  root "main#welcome"
end
