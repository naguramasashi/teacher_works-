Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  resources :users, only:[:new,:create]
  resources :topics do
    resources :coments, only: [:create,:destroy]
    get :search, on: :collection
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
