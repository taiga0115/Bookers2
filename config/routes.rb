Rails.application.routes.draw do
  
  devise_for :users
  
  get 'users/show'
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :books, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :update,:index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end