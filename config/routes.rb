Rails.application.routes.draw do
  devise_for :users
  # get '/home', to: 'users#home'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # resources :users
  get '/users', to: 'users#index'
  post '/authenticate', to: 'authentication#authenticate'
  post '/userscreate' , to: 'users#create'
  post '/user_update', to: 'users#update'
  get '/user/:id', to: 'users#show'
  post '/create_item' , to: 'items#create'
  get '/get_items', to: 'items#show'
  post '/item_update/:id', to: 'items#update' 
  post '/item_destroy/:id' , to: 'items#delete'
  post '/create_request', to: 'requests#create'
  post '/request_accepted/:id', to:'requests#request_accepted'
  resources :item_images
  post'/item_image', to:'item_images#create'
  get '/get_item_images_url/:item_id', to: 'item_images#show'
  get'/all_users', to: 'users#index'
  get '/all_items', to: 'items#index'
  get '/user_items', to: 'items#user_items'
  get '/profile', to: 'users#profile'
end
