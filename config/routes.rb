Rails.application.routes.draw do
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
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
