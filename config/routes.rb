Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'about#index'
  resources :abouts , only: [:index]
  resources :users, only: :show
  resources :groups, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :authorities, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :squares, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :diaries, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:create ,:destroy]
  end
  resources :plans, only: [:index, :new, :create, :edit, :update, :destroy]
end
