Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :users, shallow: true do
    resources :workouts do
      resources :exercises do
        resources :batches do
          resources :reps
        end
      end
    end
  end
end
