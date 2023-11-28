Rails.application.routes.draw do
  # get 'products/index'
  get 'products', to: 'products#index'
  root "main#welcome"
end
