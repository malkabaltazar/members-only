Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  root   'sessions#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :posts, only: [:new, :create, :index]
end
