Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update]
  resources :tags, only: [:index, :create]
end
