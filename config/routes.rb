Rails.application.routes.draw do
  devise_for :users, controllers:{
   invitations: 'users/invitations'}

  root 'abouts#index'
  resources :abouts , only: [:index]
  resources :users, only: :show
  resources :groups do
    resources :plans
  end
  resources :plans, only: [] do
   resources :diaries, only: [:new, :create, :update]
  end
  resources :diaries, only: [:index, :edit, :destroy] do
    resources :comments, only: [:create ,:destroy]
  end

  resources :squares


end
