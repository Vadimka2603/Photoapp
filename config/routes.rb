Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'raiting' => 'static_pages#raiting'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users do 
    resources :microposts do 
      resources :comments
    end
  end
  resources :likes,          only: [:create, :destroy]
  resources :comments
  resources :microposts, only: [:create, :destroy]
  resources :users do 
    resources :comments
  end
end
