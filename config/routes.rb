Rails.application.routes.draw do
  devise_for :users
  root 'home#top'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :lures, only: [:index, :show] do
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
