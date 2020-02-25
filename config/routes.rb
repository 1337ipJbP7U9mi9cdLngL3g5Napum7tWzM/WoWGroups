Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'home/search', to: 'home#search', as: 'search_groups'

  get 'servers', to: 'servers#index'

  get '/auth/bnet'
  get '/auth/bnet/callback' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :groups do
    post 'accept'
    post 'deny'
    post 'reserve'
  end
  resources :users, only: [:show, :edit, :update]
  resources :requests, only: [:create, :update]

end
