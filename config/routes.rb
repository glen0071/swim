Rails.application.routes.draw do

  resources :quotes
  resources :authors
  resources :concepts
  resources :writings
  resources :references

  root 'concepts#index'

end
