Rails.application.routes.draw do
  get 'plants/edit'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root to: 'homes#top'

  get 'homes/top' => 'homes#top'
  get 'homes/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :blogs do
    member do
      get :preview
    end
    resource :blog_comments, only: [:create, :destroy]
    resource :stamps, only: [:create, :destroy]
  end

  resources :topics do
    resource :topic_comments, only: [:create, :destroy]
  end

  resources :relationships, only:[:create, :destroy]

  resources :plants, only:[:create, :edit, :update, :destroy]
end
