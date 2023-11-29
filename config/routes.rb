Rails.application.routes.draw do
=begin
  # get 'products/index'
  get 'products', to: 'products#index'
  get 'products/new', to: 'products#new', as: 'new_products'
  get 'products/:id', to: 'products#show', as: :product
  # a partir de los nombres, ruby on rails nos genera los helpers para las rutas
  get 'products/:id/edit', to: 'products#edit', as: :edit_product
  patch 'products/:id', to: 'products#update'
  post 'products', to: 'products#create'

  un resources creara las rutas para un CRUD completo acorde al controlador
  Verbos HTTP    Acciones
  -get            #index
  -post           #create
  -get            #new
  -get            #edit
  -get            #show
  -patch          #update
  -delete         #destroy
=end

  resources :products

  root "main#welcome"
end
