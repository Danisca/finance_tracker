Rails.application.routes.draw do
  resources :user_stocks, only: [:create,:destroy]
  resources :friends, only: [:destroy,:create]
  get 'my_portfolio', to: "users#my_portfolio"
  get 'my_friends', to: "users#my_friends"
  get 'stocks/search_stock', to: "stocks#search_stock"
  get 'friends/search_friend', to: "friends#search_friend"
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
