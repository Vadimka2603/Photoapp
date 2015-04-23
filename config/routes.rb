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
      resources :comments do
        resources :answers
      end  
    end
  end
  
  resources :comments
  resources :microposts, only: [:create, :show, :destroy] do
    resources :likes,          only: [:show, :create, :destroy]
  end
  resources :users do 
    resources :comments
  end
  resource :instagram do
    resource :callback, only: [:show, :create]
  end

  namespace :api, defaults: {format: 'json'} do
    resources :users
    resources :microposts do
      resources :likes, controller: :likes
      resources :comments, controller: :comments
    end
    resources :likes
    resources :comments
    resource  :raiting
      
       
  end  

end
