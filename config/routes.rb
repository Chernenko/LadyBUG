PostitTemplate::Application.routes.draw do
  root to: 'projects#index'
  get'/register', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get'/register', to: 'users#new'

  resources :projects, except: [:destroy] do
    resources :issues, except: [:destroy] do
      member do
        get 'screenshot', to: 'issues#screenshot'
      end
    resources :comments,only: [:create]
    end
    end


  resources :users, only:[:create,:edit,:show,:update ]
end
