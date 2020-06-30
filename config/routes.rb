Rails.application.routes.draw do

  root 'sessions#welcome'
  resources :reviews
  resources :wines
  resources :varietals
  resources :regions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
