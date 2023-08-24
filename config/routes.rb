Rails.application.routes.draw do

  resources :projects do
    get 'iframe', on: :member
  end
  get 'friends/new'
  post 'friends/create'
  get 'friends/show'
  root 'pages#home'
  resources :games, only: [:show]
  resources :users, only: [:show]
  resources :users, except: [:show]

  get 'towerofhonoi', to: 'games#towerofhonoi'
  get 'tictactoe', to: 'games#tictactoe'
  get 'rockpaperscissor', to: 'games#rockpaper'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'  

  get '*all', to: 'application#index', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
