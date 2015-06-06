Rails.application.routes.draw do
  devise_for :users, path: 'api/users', controllers: { sessions: "api/sessions" }
  namespace :api, defaults: { format: :json } do
    resource :authentication_token, only: [:update, :destroy]

    namespace :v1 do
      resources :users, only: [:show] do
        resources :friends, only: [:index, :create]
        resources :user_tasks, only: [:index, :create, :update]
        resources :rewards, only: [:index, :create, :update]
      end
    end
  end

end
