Rails.application.routes.draw do

  get 'home/index'

  resources :quotes
  resources :authors
  resources :concepts
  resources :writings
  resources :references

  get '/home', to: 'home#index'

  root 'home#index'

end
