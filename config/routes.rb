Rails.application.routes.draw do


  devise_for :users
  patch 'users/:id'=>'users#create'
  patch 'books/:id'=>'books#create'
  post 'users'=>'users#create'
  get 'users/:id', to: 'users#show'
  get 'homes/about', to: 'homes#about', as: 'about'
  root to: 'homes#top'
  resources :books, only:[:new, :create, :destroy, :index, :show, :edit]
  resources :users, only:[:show, :edit, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
