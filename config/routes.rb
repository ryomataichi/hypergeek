Rails.application.routes.draw do
  get 'blogs/index'
  get 'rooms/show'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  resources :hellos
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :tags do
    get 'tweets', to: 'tweets#search'
  end

  get "tweets/matome/:id" => "tweets#matome", as: :tweet_matome  
  get "users/match/:bangou" => "users#match", as: :users_match  
  resources :blogs
  root to: 'tweets#index'
end