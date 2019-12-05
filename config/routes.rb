Rails.application.routes.draw do
  post '/users/login', :to => 'users#login'
  get '/users/auto_login', :to => 'users#auto_login'
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
