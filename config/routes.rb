Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :videos, only: %i[index create show destroy edit update]
      resources :registrations, only: %i[create]

      get '/recommended_videos', to: 'videos#recommended_videos'
      get '/myVideos', to: 'videos#user_videos'
      put '/incrementView', to: 'videos#increment_view'
      post '/auth', to: 'sessions#auth'
    end
  end
  # devise_for :users
  # root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
