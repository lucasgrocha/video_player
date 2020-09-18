Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :video, only: %i[index create show]
      get '/recommended_videos', to: 'video#recommended_videos'
    end
  end
  devise_for :users
  root to: 'home#index'
  get '/*path' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
