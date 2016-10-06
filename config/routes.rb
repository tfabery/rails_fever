Rails.application.routes.draw do
  root to: 'users#index'

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

  get '/log-in' => 'sessions#new'
  post '/log-in' => 'sessions#create'
  get '/log-out' => 'sessions#destroy', as: :log_out
end
