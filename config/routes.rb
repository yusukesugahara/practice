Rails.application.routes.draw do
  devise_for :users, controllers:{
   invitations: 'users/invitations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'abouts#index'
  resources :abouts , only: [:index]
  resources :users, only: :show
  resources :groups
  resources :authorities, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :squares
  resources :diaries, only: [:index, :edit, :update, :destroy] do
    resources :comments, only: [:create ,:destroy]
  end
  resources :plans do
   resources :diaries, only: [:new, :create]
  end
end
