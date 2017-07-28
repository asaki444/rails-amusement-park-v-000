Rails.application.routes.draw do
  resources :users
  get '/', to: 'users#index'
  root 'users#index'
end
