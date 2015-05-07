Rails.application.routes.draw do
  
  post :incoming, to: 'incoming#create'
  
  devise_for :users
  root 'topics#index'
  
  resources :topics do
    resources :bookmarks
  end 
  
end
