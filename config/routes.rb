Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  get '/artists' => 'artists#index', as: :artists

  get '/auth/:provider/callback' => 'sessions#omniauth'
  

  resources :equalizers
  resources :artists do
    resources :equalizers, only: [:new, :index]
  end
  resources :users do 
    resources :artists, only: [:index, :show]
  end
  resources :genres
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
