Rails.application.routes.draw do
  
  post :incoming, to: 'incoming#create'
  
  devise_for :users
  root 'welcome#index'
  
  resources :topics do
    resources :bookmarks
  end 
  
end
