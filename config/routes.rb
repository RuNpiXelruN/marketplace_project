Rails.application.routes.draw do
  resources :homepage, only: :index
  resources :mentors, only: :show

  root 'dashboard#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
