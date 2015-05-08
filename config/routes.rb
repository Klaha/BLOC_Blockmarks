Rails.application.routes.draw do
  
  post :incoming, to: 'incoming#create'
  
  devise_for :users
  resources :users, only: [:show]
  
  resources :topics do
    resources :bookmarks
  end
  
  resources :bookmarks, only: [] do
    resources :likes, only: [:new, :create, :destroy]
  end
  
  root 'topics#index'
  
end
