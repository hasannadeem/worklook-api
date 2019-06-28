Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :workers, only: [:index, :create, :destroy] do
        member do
          get '/get_works', to: 'workers#get_works'
        end
      end

      resources :works, only: [:index, :create] do
        member do
          post '/add_worker', to: 'works#add_worker'
        end
      end
    end
  end
end
