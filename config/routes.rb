Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
        get '/forecast', to: 'weather#index'
        get '/backgrounds', to: 'backgrounds#index'
        post '/api/v1/users', to : 'users#create'
      end
    end
end
