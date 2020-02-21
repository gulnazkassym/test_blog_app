Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get 'users', to: 'users#index'
  get 'user_posts', to: 'users#posts'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'

  resource :favorite_posts, only: [:create, :destroy]
  get 'favorites', to: 'favorite_posts#index', as: 'favorites'

  root 'posts#index'
  resources :posts
  get 'unreaded', to: 'posts#unreaded_posts'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
