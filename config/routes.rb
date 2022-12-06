Rails.application.routes.draw do
  resources :articles do
   collection do
      post 'search'
      end
      end
   root 'articles#index'
    get 'about', to: 'pages#about'
    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    post 'search', to: 'articles#search'

    get 'logout', to: 'sessions#destroy'
 resources :users, except: [:new]
    
 end