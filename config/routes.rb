Rails.application.routes.draw do
  resources :homepage, only: :index

  root 'dashboard#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
