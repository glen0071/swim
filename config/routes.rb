Rails.application.routes.draw do
  resources :quotes
  resources :authors
  resources :publications
end
