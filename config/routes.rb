Rails.application.routes.draw do
  get 'my_portfolio', to: "users#my_portfolio"
  get 'stocks/search_stock', to: "stocks#search_stock"
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
