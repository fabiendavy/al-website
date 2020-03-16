Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, only: [:index, :show, :new, :create, :edit, :update] do
    resources :article_tags, only: [:create]
  end
end
