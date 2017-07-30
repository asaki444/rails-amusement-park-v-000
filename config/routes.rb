Rails.application.routes.draw do
  resources :users, :attractions, :rides
  get '/', to: 'users#index'
  root 'users#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
end
