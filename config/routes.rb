Rails.application.routes.draw do
  #devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :user_tasks, only: [:index, :create, :update]
      end
    end
  end

end
