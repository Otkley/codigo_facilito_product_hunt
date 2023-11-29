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
  delete 'products/:id, to: 'products#destroy 

  La ruta destroy solo podra ser accedida con el metodo HTTP delete

  un resources creara las rutas para un CRUD completo (8 rutas) pasandole el controlador como simbolo
  Verbos HTTP    Acciones
  -get            #index
  -post           #create
  -get            #new
  -get            #edit
  -get            #show
  -patch          #update
  -put            #update
  -delete         #destroy

  El product_path sirve tanto para ver, actualizar o eliminar, el cambio es el verbo HTTP
=end

  resources :products

  root "main#welcome"
end
