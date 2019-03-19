Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'about#index'
  resources :about , only: [:index]
  resources :user, only: :index
  resources :group, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :authoritey, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :square, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :diary, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :comment, only: [:create ,:destroy]
  end
  resources :plan, only: [:index, :new, :create, :edit, :update, :destroy]


end
