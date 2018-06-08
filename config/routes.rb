Rails.application.routes.draw do
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
