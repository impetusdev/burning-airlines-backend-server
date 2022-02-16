
Rails.application.routes.draw do
  
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
    root :to => "pages#home"
    resources :reservations
    resources :users
    resources :flights
    resources :planes
    get "/login" => "session#new"
    post "/login" => "session#create" #form submitts here

    delete "/login" => "session#destroy"
  end
end
