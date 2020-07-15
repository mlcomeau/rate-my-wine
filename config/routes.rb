Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  get 'auth/google_oauth2/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#new'

  resources :reviews, only: [:new, :create, :index]  
  resources :wines, except: [:update, :destroy, :edit] do 
    resources :reviews, only: [:new, :index]
  end 
  resources :varietals, only: [:index] do 
    resources :wines, only: [:index]
  end 
  resources :regions, only: [:index] do 
    resources :wines, only: [:index]
  end 
  resources :users, only: [:new, :create, :show]

end
