Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :index, :create, :show, :edit, :destroy, :update]
  resources :users, only: [:index, :show, :edit]
  get 'home/about' => 'homes#about'
end
