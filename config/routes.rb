Rails.application.routes.draw do
  post '/api/v1/users/login', :to => 'api/v1/users#login'
  get '/api/v1/users/auto_login', :to => 'api/v1/users#auto_login'
  namespace :api do
    namespace :v1 do
      resources :tasks
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
