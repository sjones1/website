Rails.application.routes.draw do


  get 'articles/new'

  root 'static_pages#home'

  get 'new_fundraiser' => 'fundraisers#new'
  get 'fundraiser' => 'fundraisers#index'
  get 'donate' => 'static_pages#donate'
  get 'home' => 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :fundraisers
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :articles
end
