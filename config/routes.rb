Rails.application.routes.draw do


  devise_for :users




  post 'users'=>'users#create'
  get 'users/:id', to: 'users#show'
  get 'home/about', to: 'home#about', as: 'about'
  get 'homes/about', to: 'homes#about'
  root to: 'homes#top'
  resources :books, only:[:new, :create, :destroy, :index, :show, :edit, :update]
  resources :users, only:[:show, :edit, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end