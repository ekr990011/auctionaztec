Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'auctions#index'
  
  resource :auctions, only: [:create, :update, :destroy]
  
  resource :users, only: [:create]
  
  resource :sessions, only: [:create, :destroy]
  
  resource :bids, only: [:create]
end
