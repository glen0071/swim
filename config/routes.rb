Rails.application.routes.draw do
  get '/about', to: "home#about"

  devise_for :users
  resources :quotes
  resources :authors
  resources :concepts
  resources :writings
  resources :references

  namespace :api do
    namespace :v1 do
      resources :quotes
      resources :authors
      resources :concepts
      resources :writings
      resources :references
    end
  end

  root 'concepts#index'
end
