Rails.application.routes.draw do
  root 'concepts#index'

  resources :quotes
  resources :authors
  resources :publications
  resources :concepts
  resources :writings
  resources :references
end
