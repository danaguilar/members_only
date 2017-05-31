Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: 'session#new', as: 'login'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  resources :posts, only: [:index, :new, :create]
end
