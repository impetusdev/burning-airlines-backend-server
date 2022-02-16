
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "pages#home"
  
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  Rails.application.routes.draw do # TODO: EXPLAIN WHAT THIS IS 
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  
  get "/login" => "session#new"
  post "/login" => "session#create" #form submitts here
  delete "/login" => "session#destroy"
  
  get "/flights/search/:origin/:destination" => "flights#filtered_index"
  resources :reservations
  resources :users
  resources :flights
  resources :planes
  
  end
end
