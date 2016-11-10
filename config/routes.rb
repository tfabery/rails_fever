Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'

  resources :users do
    resources :posts, except: [:index]
  end

  resources :posts do
    resources :comments, except: [:show, :index]
  end

  resources :comments do
    resources :comments, except: [:show, :index]
  end

  resources :streamers
end
