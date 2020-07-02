Rails.application.routes.draw do

  root 'sessions#welcome'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'

  resources :reviews
  resources :wines do 
    resources :reviews, only: [:new, :index]
  end 
  resources :varietals do 
    resources :wines, only: [:index]
  end 
  resources :regions do 
    resources :wines, only: [:index]
  end 
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
