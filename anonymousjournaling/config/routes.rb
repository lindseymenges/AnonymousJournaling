Anonymousjournaling::Application.routes.draw do
  root to: 'application#index'

  resources :users, :entries
  resources :sessions, only: [:new, :create, :destroy]
end
