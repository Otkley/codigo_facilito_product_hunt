Rails.application.routes.draw do
  # get 'products/index'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new'

  root "main#welcome"
end
