Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  
  resource :profile, only: [:show, :edit, :update]
  
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :posts, only: [:index, :create, :show]
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
